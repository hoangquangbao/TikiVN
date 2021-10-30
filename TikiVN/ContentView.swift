//
//  ContentView.swift
//  TikiVN
//
//  Created by Quang Bao on 29/10/2021.
//

import SwiftUI


//class ViewModel: ObservableObject {
//
//    //    @Published var courses : [Datum] = []
//    //    @Published var courses : Course!
//    @Published var courses : Data?
//
//
//    //    func fetch() {
//    //
//    //        let jsonUrl = "https://api.tiki.vn/shopping-trend/api/trendings/hub?cursor=0&limit=20"
//    //
//    //        guard let url = URL(string: jsonUrl)
//    //        else { return }
//    //
//    //       let task = URLSession.shared.dataTask(with: url) { [weak self]
//    //            data, _, err in
//    //
//    //            guard let data = data, err == nil
//    //           else { return }
//    //
//    //           //Conver to JSON
//    //            do {
//    //                let courses = try  JSONDecoder().decode(Course.self, from: data)
//    //                DispatchQueue.main.async {
//    //                    self?.courses = courses
//    //                }
//    //            } catch {
//    //                print(error)
//    //            }
//    //        }
//    //        task.resume()
//    //    }
//
//    func parse() {
//
//        let jsonUrlString = "https://api.tiki.vn/shopping-trend/api/trendings/hub?cursor=0&limit=20"
//
//        guard let url = URL(string: jsonUrlString) else { return }
//
//        URLSession.shared.dataTask(with: url) {
//            data, response, err in
//
////            if err != nil {
////                print(err?.localizedDescription)
////                return
////            }
//
////                guard let data = data, err == nil
//            guard let data = data
//                else {
//                    return
//                }
//            do {
//                let result = try  JSONDecoder().decode(Data.self, from: data)
//                self.courses = result
//            } catch {
//
//            }
//        }
//        .resume()
//
//
//
//
//    }
//
//
//}



struct ContentView: View {
    
//    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        
        HomeView()
//        NavigationView {
//
//        Text("Course")
//
////            if let data : [Datum] = viewModel.courses?.data?.data {
//
//                List {
//                    ForEach((viewModel.courses?.data?.data)!) { crs in
//                        HStack {
//                            Image("")
//                            Text(crs.name!)
//                        }
//                    }
//                }
//
//                //.navigationTitle("Data")
//                .onAppear {
//                    viewModel.parse()
//                }
//            //}
//
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

