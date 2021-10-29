//
//  ContentView.swift
//  TikiVN
//
//  Created by Quang Bao on 29/10/2021.
//

import SwiftUI

struct ContentView: View {
    
    var userHomeViewModel = HomeViewModel()
    var body: some View {
        Text("Hello, world!")
            .padding()
        
//        userHomeViewModel.fetchData()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
