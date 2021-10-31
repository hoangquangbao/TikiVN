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
        
        VStack(spacing: 15){
            
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
            let columns = Array(repeating: GridItem(.flexible(), spacing: 4), count: 2)
            
            //Show Products
            ScrollView(.vertical, showsIndicators: false){
                
                LazyVGrid(columns: columns, spacing: 4) {
                    
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
        .padding(4)
        .padding(.bottom, 60)
        .onAppear {
            baseViewModel.parse()
        }
    }
    
    
    func CardView(item: Datum) -> some View {
        
        VStack(alignment: .leading, spacing: 3){
            
//            HStack {
//                if(item.badgesNew. == "freeship_tikifast"){
//
//                }
//            }
            
            WebImage(url: URL(string: item.thumbnailURL!))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 250)
            
            VStack(alignment: .leading, spacing: 6) {
                
                Text(item.name!)
                    .font(.system(size: 12, weight: .semibold))
//                    .font(.system(size: 14))
                    .lineLimit(2)
                    .lineSpacing(3)
                
                HStack(spacing: 1){

                    HStack(spacing: 0) {
                        ForEach(1...5, id: \.self){index in
                            Image(systemName: "star.fill")
                                .font(.system(size: 10))
                                .foregroundColor(Int(item.ratingAverage!) >= index ? .yellow : .gray.opacity(0.2))
                        }
                    }
                    
                    Text(" (\(Int(item.ratingAverage!)).0) |")
                        .font(.system(size: 9))
                        .foregroundColor(.gray)
                    
                    Text((item.quantitySold?.text)!)
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.gray)
                }
                
                Text("\(item.price!) đ")
                    .font(.system(size: 15, weight: .semibold))
                
            }.offset(y: -15)
        }
        .padding(5)
//        .padding(.bottom,5)
        .background(Color.white, in: RoundedRectangle(cornerRadius: 12))
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
