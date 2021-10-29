//
//  HomeViewModel.swift
//  TikiVN
//
//  Created by Quang Bao on 29/10/2021.
//

import SwiftUI


class HomeViewModel: ObservableObject {
    
    @Published var product : [Datum]?
    
    //var pertiton = [Data]()
//    var pertiton: Data?
    
    func fetchData() {
        
        let jsonUrlString = "https://api.tiki.vn/shopping-trend/api/trendings/hub?cursor=0&limit=20"
        
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
            guard let data = data else { return }
            
            do {
//                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else { return }
//                //Cách này phải viết thêm hàm khởi tạo
//                let course = Data(json: json)
                
                
                let course = try  JSONDecoder().decode(Data.self, from: data)
                
                self.product = course.data?.data
                
                
                //print(course.data?.data)
            } catch let jsonErr {
                
                print("Error serializing json:", jsonErr)
                
            }
        }
        .resume()
    }
}

