//
//  HomeViewModel.swift
//  TikiVN
//
//  Created by Quang Bao on 29/10/2021.
//

import SwiftUI


class HomeViewModel: ObservableObject {
    
    //For get JSON data
    @Published var data : [Datum] = []
    @Published var metaData : MetaData?
    @Published var metaDataItems : [Item] = []


    
    //Tab bar
    @Published var currentTab: Tab = .Home
    
    //Item
    @Published var currentProduct : Datum?
    @Published var showDetail = false
    @Published var notGetDataFromJSON = false
    
    
    func parse() {
        
        let jsonUrlString = "https://api.tiki.vn/shopping-trend/api/trendings/hub?cursor=0&limit=20"
        
        guard let url = URL(string: jsonUrlString)
        else {
            return
        }
        URLSession.shared.dataTask(with: url) { 
            dataFromServer, response, err in
//            if err != nil {
//                //                self.notGetDataFromJSON = true
//                print(err as Any)
//                return
//            }
            guard let tempData = dataFromServer
            else {
                self.notGetDataFromJSON = true
                return
            }
            
            do { let result = try JSONDecoder().decode(Data.self, from: tempData)
                
                DispatchQueue.main.async {
                    self.data = (result.data?.data)!
                    self.metaData = result.data?.metaData
                    self.metaDataItems = (result.data?.metaData?.items)!
                }
            } catch {
                self.notGetDataFromJSON = true
                //print("Error")
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


