//
//  HomeViewModel.swift
//  TikiVN
//
//  Created by Quang Bao on 29/10/2021.
//

import SwiftUI


class HomeViewModel: ObservableObject {
    
    @Published var product : [Datum] = []
    //Tab bar
    @Published var currentTab: Tab = .Home
    
//    func parse() {
//
//            let jsonUrlString = "https://api.tiki.vn/shopping-trend/api/trendings/hub?cursor=0&limit=20"
//
//            guard let url = URL(string: jsonUrlString) else { return }
//
//            URLSession.shared.dataTask(with: url) {
//                data, response, err in
//
//                if err != nil {
//                    print(err?.localizedDescription)
//                    return
//                }
//
//                do {
//                    let result = try  JSONDecoder().decode(Course.self, from: data!)
//
//                    print(result)
//                } catch {
//
//                }
//            }
//            .resume()
//}
    
    func parse() {

        let jsonUrlString = "https://api.tiki.vn/shopping-trend/api/trendings/hub?cursor=0&limit=20"

        guard let url = URL(string: jsonUrlString) else { return }

        URLSession.shared.dataTask(with: url) {
            data, response, err in

            if err != nil {
                //print(err?.localizedDescription)
                return
            }

            do {
                let result = try  JSONDecoder().decode(Data.self, from: data!)
                
//                self.product = (result.data?.data)!
                DispatchQueue.main.async {
                    self.product = (result.data?.data)!
                }

                print(result)
            } catch {

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


