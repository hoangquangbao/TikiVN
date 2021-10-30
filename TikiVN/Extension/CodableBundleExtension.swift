//
//  CodableBundleExtension.swift
//  TikiVN
//
//  Created by Quang Bao on 30/10/2021.
//

import Foundation

//var product : DataClass?
var product : [Datum]?


extension Bundle {
    //    func decode(_ file: String) -> [Data] {
    //        //1. Local the JSON file
    //        guard let url = self.url(forResource: file, withExtension: nil) else {
    //            fatalError("Error to locate \(file) in bunlde")
    //        }
    //
    //        //2. Create a property for the data
    //        guard let data = try? NSData(contentsOf: url) else {
    //            fatalError("Error to locate \(file) in bunlde")
    //        }
    //
    //        //3. Create a decoder
    //        let decoder = JSONDecoder()
    //
    //        //4. Create a property for the decoder data
    //        guard let loaded = try? decoder.decode([Data].self, from: data as Data) else {
    //            fatalError("Error to locate \(file) in bunlde")
    //        }
    //
    //        //5. Return the ready-to-use data
    //        return loaded
    //    }
    
    func fetchData() -> [Datum] {
        
        //1. Local the JSON file
        let jsonUrlString = "https://api.tiki.vn/shopping-trend/api/trendings/hub?cursor=0&limit=20"
        //        guard let url = URL(string: jsonUrlString) else { break }
        guard let url = URL(string: jsonUrlString) else {
            fatalError("Error to locate in bunlde")
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
            //2. Create a property for the data
            guard let data = data else { return }
            
            do {
                
                let course = try  JSONDecoder().decode(Data.self, from: data)
                
                DispatchQueue.main.async {
                    product = course.data?.data
                }
                
                //print(course.data?.data)
            } catch let jsonErr {
                
                print("Error serializing json:", jsonErr)
                
            }
        }
        .resume()
        return product!
    }
}


