//
//  HomeViewModel.swift
//  TikiVN
//
//  Created by Quang Bao on 29/10/2021.
//

import SwiftUI


class HomeViewModel: ObservableObject {
    
    //For get JSON data
    @Published var items : [Datum] = []
    
    //Tab bar
    @Published var currentTab: Tab = .Home
    
    //Item
    @Published var currentProduct : Datum?
    @Published var showDetail = false
    //@Published var notGetDataFromJSON = false
    
    
    
    func parse() {
        
        let jsonUrlString = "https://api.tiki.vn/shopping-trend/api/trendings/hub?cursor=0&limit=20"
        
        guard let url = URL(string: jsonUrlString)
        else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { [self]
            data, response, err in
            if err != nil {
                //                self.notGetDataFromJSON = true
                print(err as Any)
                return
            }
            do {
                let result = try  JSONDecoder().decode(Data.self, from: data!)
                DispatchQueue.main.async {
                    self.items = (result.data?.data)!
                    print(items)
                }
            } catch {
                print("Error")
            }
        }
        .resume()
    }
}


enum Tab: String{
    
    case Home = "home"
    case Trend = "trend"
    case Category = "category"
    case Personal = "personal"
}


