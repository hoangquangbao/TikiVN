//
//  HomeView.swift
//  TikiVN
//
//  Created by Quang Bao on 30/10/2021.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var baseData = HomeViewModel()
    
    var body: some View {
        
        TabView(selection: $baseData.currentTab){
            Home()
                .environmentObject(baseData)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    Image("background_color")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .ignoresSafeArea()
                )
                .tag(Tab.Home)
            
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
            
            Category()
                .environmentObject(baseData)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.gray.opacity(0.2))
                .tag(Tab.Category)
            
            Personal()
                .environmentObject(baseData)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    Image("background_color")
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
                    
                    Image(systemName: "cart.fill")
                        .resizable()
                        .frame(width: 26, height: 26)
                        .offset(x: -1)
                        .foregroundColor(.blue)
                        .padding(18)
                        .background(.white)
                        .clipShape(Circle())
                        .shadow(color: .black.opacity(0.2),
                                radius: 0.5,
                                x: 0.5,
                                y: -0.5)
                        .shadow(color: .black,
                                radius: 0.5,
                                x: 0.5,
                                y: 0.5)
                        .shadow(color: .black,
                                radius: 0.5,
                                x: -0.5,
                                y: 0.5)
                        .shadow(color: .black,
                                radius: 0.5,
                                x: -0.5,
                                y: -0.5)
                }
                .offset(y: -25)
                
                //Right
                TabButton(Tab: .Category)
                    .offset(x: 10)
                TabButton(Tab: .Personal)
            }
                .offset(y: 15)
                .background(
                    Color.white.clipShape(CustomCurveShape())
                        .offset(y: 20)
                        .shadow(color: .black.opacity(0.5), radius: 2, x: 0, y: -2)
                    //.edgesIgnoringSafeArea(.bottom)
                        .ignoresSafeArea(.container, edges: .bottom)
                )
            //hidding tab bar when DetailView open
                .offset(y: baseData.showDetail ? 200 : 0)
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
                .foregroundColor(baseData.currentTab == Tab ? Color.blue : Color.gray.opacity(0.5))
                .frame(maxWidth: .infinity)
        }
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
