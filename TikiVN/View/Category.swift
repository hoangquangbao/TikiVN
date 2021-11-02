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
                
                TextField("Sản phẩm, thương hiệu và mọi thứ bạn cần...   ", text: $baseViewModel.search)
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
                        }
                    }
                }
                
                Spacer()
                
                Text("Note:Show category of product in here    ")
                    .font(.system(size: 12))
                    .foregroundColor(.red)
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
                    .padding()
                
                Text(item.title!)
                    .font(.system(size: 10))
                    .lineLimit(2)
                    .foregroundColor(.black)
            }
            //.padding(4)
            .frame(width: 100, height: 100, alignment: .center)
            .background(.white)
        }
    }
}

struct Category_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
