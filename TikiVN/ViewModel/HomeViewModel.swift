//
//  HomeViewModel.swift
//  TikiVN
//
//  Created by Quang Bao on 29/10/2021.
//

import SwiftUI


class HomeViewModel: ObservableObject {
    
    @Published var product : [Datum]?

    
    //Tab bar
    @Published var currentTab: Tab = .Home
    
    
//    func fetchData() {
//
//        let jsonUrlString = "https://api.tiki.vn/shopping-trend/api/trendings/hub?cursor=0&limit=20"
//
//        guard let url = URL(string: jsonUrlString) else { return }
//
//        URLSession.shared.dataTask(with: url) { (data, response, err) in
//
//            guard let data = data else { return }
//
//            do {
////                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else { return }
////                //Cách này phải viết thêm hàm khởi tạo
////                let course = Data(json: json)
//
//
//                let course = try  JSONDecoder().decode(Data.self, from: data)
//
//                DispatchQueue.main.async {
//                    self.product = course.data?.data
//                }
//
//                //print(course.data?.data)
//            } catch let jsonErr {
//
//                print("Error serializing json:", jsonErr)
//
//            }
//        }
//        .resume()
//    }
    
    
    
//    func fetchData() {
//        
//        let jsonUrlString = "https://api.tiki.vn/shopping-trend/api/trendings/hub?cursor=0&limit=20"
//        
//        guard let url = URL(string: jsonUrlString) else { return }
//        
//        URLSession.shared.dataTask(with: url) { (data, response, err) in
//            
//            guard let data = data else { return }
//            
//            do {
//
//                let course = try  JSONDecoder().decode(Data.self, from: data)
//                
//                DispatchQueue.main.async {
//                    self.product = course.data?.data
//                }
//                
//                //print(course.data?.data)
//            } catch let jsonErr {
//                
//                print("Error serializing json:", jsonErr)
//                
//            }
//        }
//        .resume()
//    }
    
    
    
    
}


enum Tab: String{
    
    case Home = "home"
    case Trend = "trend"
    case Category = "category"
    case Personal = "personal"
}

