//
//  Category.swift
//  TikiVN
//
//  Created by Quang Bao on 30/10/2021.
//

import SwiftUI
import SDWebImageSwiftUI


struct Category: View {
    
    @Namespace var animation
    @EnvironmentObject var baseViewModel : HomeViewModel
    
    var body: some View {
        
        
        VStack{
            //MARK: - Search Product
            HStack(alignment: .center, spacing: 5){
                
                Image(systemName: "magnifyingglass")
                    .font(.title2)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                
                TextField("Sản phẩm, thương hiệu và mọi thứ bạn cần...   ", text: $baseViewModel.search)
//                    .onTapGesture {
//                        baseViewModel.showDetail = false
//                    }

            }
            .padding(.vertical)
            .frame(maxWidth: .infinity, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 10).fill(.white))
            .padding(.horizontal,5)
            
            HStack {
                ScrollView(.vertical, showsIndicators: false){
                    VStack(alignment: .leading, spacing: 0) {
                        ForEach(baseViewModel.metaDataItems){item in
                            Category(item: item)
                                .onTapGesture {
                                    withAnimation {
                                        baseViewModel.showDetail = true
                                    }
                                }
                        }
                    }
                }
                
                Spacer()
                
                Text("Note: Show category of product in here    ")
                    .font(.system(size: 12))
            }
        }
    }
    
    func Category(item: Item) -> some View {
        
        Button {
            
        } label: {
            VStack(spacing: 5) {
                WebImage(url: URL(string: item.images![0]))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(5)
                
                Text(item.title!)
                    .font(.system(size: 8, weight: .bold))
                    .foregroundColor(.blue)
                    .lineLimit(2)
                    .foregroundColor(.black)
                    .padding(.bottom, 5)
            }
            //.padding(4)
            .frame(width: 100, height: 100, alignment: .center)
            .background(
                Color.white
                    .shadow(color: .black.opacity(0.9), radius: 1, x: 2, y: 0)
            )
        }
    }
}

struct Category_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
