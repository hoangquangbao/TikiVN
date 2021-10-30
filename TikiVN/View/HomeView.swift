//
//  HomeView.swift
//  TikiVN
//
//  Created by Quang Bao on 30/10/2021.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var baseData = HomeViewModel()
   
    
    //Hiding Tab bar...
    init(){
        
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        
        TabView(selection: $baseData.currentTab){
            
            
            //            Text("Home!")
            Home()
                .environmentObject(baseData)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    Image("background")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .ignoresSafeArea()
                )
                .tag(Tab.Home)
            
            
            //            Text("Trend!")
            Trend()
                .environmentObject(baseData)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    Image("background")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .ignoresSafeArea()
                )
                .tag(Tab.Trend)
            
            
            //            Text("Category!")
            Category()
                .environmentObject(baseData)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    Image("background")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .ignoresSafeArea()
                )
                .tag(Tab.Category)
            
            
            //            Text("Personal!")
            Personal()
                .environmentObject(baseData)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    Image("background")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .ignoresSafeArea()
                )
                .tag(Tab.Personal)
        }
        
        .overlay(
            
            //Custom Tab Bar...
            HStack(spacing: 0){
                
                //Left
                TabButton(Tab: .Home)
                TabButton(Tab: .Trend)
                    .offset(x: -10)
                
                //Center
                Button {
                    
                } label: {
                    
                    Image("cart")
                        .resizable()
                        .frame(width: 26, height: 26)
                        .offset(x: -1)
                        .foregroundColor(.white)
                        .padding(18)
                        .background(Color.blue)
                        .clipShape(Circle())
                }
                .offset(y: -30)
                
                //Right
                TabButton(Tab: .Category)
                    .offset(x: 10)
                TabButton(Tab: .Personal)
            }
                .background(
                    Color.white.clipShape(CustomCurveShape())
                        .shadow(color: .gray, radius: 5, x: 0, y: -5)
                        .edgesIgnoringSafeArea(.bottom)
                )
            ,alignment: .bottom
        )
    }
    
    @ViewBuilder
    func TabButton(Tab: Tab)-> some View{
        
        Button {
            
            withAnimation {
                baseData.currentTab = Tab
            }
        } label: {
            
            Image(Tab.rawValue)
                .resizable()
                .renderingMode(.template)
                .frame(width: 25, height: 25)
                .foregroundColor(baseData.currentTab == Tab ? Color.black : Color.gray.opacity(0.5))
                .frame(maxWidth: .infinity)
        }
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
