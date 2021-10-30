//
//  Home.swift
//  TikiVN
//
//  Created by Quang Bao on 30/10/2021.
//

import SwiftUI

struct Home: View {
    
    @EnvironmentObject var baseViewModel : HomeViewModel
    
    var parse : [Datum] = []
    
    var body: some View {
        
        VStack{
            
            HStack{
                Button {
                } label: {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 25, weight: .bold))
                }
                
                Spacer()
                
                Button {
                } label: {
                    Image(systemName: "bell.fill")
                        .font(.system(size: 25, weight: .bold))
                }
            }
            .foregroundColor(.white)
            .padding(.horizontal)
            
            .overlay(Image("tikilogo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100)
            )
            
            
            
            
            
            
            
            
        }
        .onAppear {
            baseViewModel.parse()
        }
    }
    
    
    func CardView(product: Datum) -> some View {
        
        VStack(spacing: 8){
            
            Text(product.brandName!)
                .fontWeight(.semibold)
                .lineLimit(2)
                .padding(.top)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(5)
        //.background(Color.gray.opacity(0.1), in: RoundedRectangle(cornerRadius: 12))
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
