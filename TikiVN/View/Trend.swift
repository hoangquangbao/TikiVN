//
//  Trend.swift
//  TikiVN
//
//  Created by Quang Bao on 30/10/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct Trend: View {
    
    @Namespace var animation
    @EnvironmentObject var baseViewModel : HomeViewModel
    
    var body: some View {
        
        VStack(spacing: 15){
            
            Text((baseViewModel.metaData?.title)!)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
            
            Text((baseViewModel.metaData?.subTitle)!)
                .font(.system(size: 15))
                .foregroundColor(.white)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(spacing: 10) {
                    //WebImage(url: baseViewModel.metaDataItems)
                    ForEach(baseViewModel.metaDataItems){item in
                        Category(item: item)
                    }
                }
                .padding(.horizontal)
            }
        }
        //.ignoresSafeArea()
        
    }

//MARK: - func{...} for Category Tab

    func Category(item: Item) -> some View {
        
        VStack(){
            
            WebImage(url: URL(string: item.images![0]))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .cornerRadius(10)
            
            Text(item.title!)
                .font(.system(size: 5, weight: .semibold))
                .lineLimit(2)
            //.lineSpacing(3)
            
        }
        .frame(width: 70, height: 70, alignment: .center)
        .padding(5)
        .background(Color.white, in: RoundedRectangle(cornerRadius: 12))
    }
}

struct Trend_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

