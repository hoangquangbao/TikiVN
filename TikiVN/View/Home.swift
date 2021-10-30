//
//  Home.swift
//  TikiVN
//
//  Created by Quang Bao on 30/10/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct Home: View {
    
    @EnvironmentObject var baseViewModel : HomeViewModel
    
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
            
//            if baseViewModel.notGetDataFromJSON {
//                
//                VStack(spacing: 0) {
//                    
//                    Text("Tiki.vn")
//                        .padding(.top)
//                        .font(.system(size: 20, weight: .bold))
//                        .foregroundColor(.blue)
//                    
//                    Text("Quí khách vui lòng quay lại sau ít phút. Dịch vụ đang tạm ngưng để nâng cấp hệ thống")
//                        .padding()
//                        .font(.system(size: 15, weight: .bold))
//                        .foregroundColor(.black)
//                }
//                .frame(width: UIScreen.main.bounds.width - 100)
//                .background(Color.white)
//                .cornerRadius(10)
//            }
            
            
            //Product View
            let columns = Array(repeating: GridItem(.flexible(), spacing: 10), count: 2)
            
            //Show Products
            ScrollView(.vertical, showsIndicators: false){
                
                LazyVGrid(columns: columns, spacing: 10) {
                    
                    ForEach(baseViewModel.items){ item in
                        
                        CardView(item: item)
                            .onTapGesture {
                                withAnimation {
                                    baseViewModel.currentProduct = item
                                    baseViewModel.showDetail = true
                                }
                            }
                    }
                }
            }
        }
        .onAppear {
            baseViewModel.parse()
        }
    }
    
    
    func CardView(item: Datum) -> some View {
        
        VStack(spacing: 8){
            
            //            Image(product.productImage)
            //                .resizable()
            //                .aspectRatio(contentMode: .fit)
            //                .frame(height: 250)
            WebImage(url: URL(string: item.thumbnailURL!))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 250)
            
            Text(item.name!)
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
