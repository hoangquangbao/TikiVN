//
//  Home.swift
//  TikiVN
//
//  Created by Quang Bao on 30/10/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct Home: View {
    
    @Namespace var animation
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
            .padding(.top,0)
            
            .overlay(Image("tikilogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 45)
                        .foregroundColor(.blue)
            )
        
//MARK: - Notification while Get Error Data
            if baseViewModel.notGetDataFromJSON {
                
                VStack(spacing: 0) {
                    
                    Text("Tiki.vn")
                        .padding(.top)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.blue)
                    
                    Text("Quí khách vui lòng quay lại sau ít phút. Dịch vụ đang tạm ngưng để nâng cấp hệ thống.")
                        .padding()
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(.black)
                    
                    Text("hotro.tiki.vn | Hotline: 1900-6035")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundColor(.gray.opacity(0.7))
                }
                .frame(width: UIScreen.main.bounds.width - 100)
                .background(Color.white)
                .cornerRadius(10)
            }
            
//MARK: - Category Tab
            
            ScrollView(.horizontal, showsIndicators: false){
                
                HStack(spacing: 0){
                    
                    //Segmenttab....
                    CategoryButton(title: "Thịt, rau củ")
                    CategoryButton(title: "Bách Hóa")
                    CategoryButton(title: "Nhà Cửa")
                    CategoryButton(title: "Thiết Bị Số")
                    CategoryButton(title: "Điện Thoại")
                    CategoryButton(title: "Mẹ & Bé")
                    CategoryButton(title: "Làm Đẹp")
                    CategoryButton(title: "Gia Dụng")
                    CategoryButton(title: "Thời Trang Nam")
                    CategoryButton(title: "Thời Trang Nữ")
                }
            }
            
//MARK: - Search Product
//            HStack(spacing: 15){
//
//                Image(systemName: "magnifyingglass")
//                .font(.title2)
//                .foregroundColor(.gray)
//
//                TextField("Bạn tìm gì hôm nay?", text: $baseViewModel.search)
//            }
//            .padding(.horizontal)
//
            
//MARK: - Product View
            
            let columns = Array(repeating: GridItem(.flexible(), spacing: 4), count: 2)
            
            //Show Products
            ScrollView(.vertical, showsIndicators: false){
                
                LazyVGrid(columns: columns, spacing: 4) {
                    
                    ForEach(baseViewModel.data){ item in
                        
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
        .padding(.bottom, 15)
        .onAppear {
            baseViewModel.parse()
        }
    }
    
//MARK: - func{...} for Category Tab
    
    @ViewBuilder
    func CategoryButton(title: String) -> some View {
        
        Button {
            withAnimation{baseViewModel.categoryTab = title}
        } label: {
            
            HStack(spacing: 8){
                Text(title)
                    .font(.system(size: 12))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .padding(.vertical,8)
            .padding(.horizontal,12)
            .background(
                
                ZStack{
                
                //Transition Slider....
                if baseViewModel.categoryTab == title{
                    
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color.white.opacity(0.3))
                    
                    // Dùng để di chuyển hình nền của các Tab
                        .matchedGeometryEffect(id: "TAB", in: animation)

                }
            }
            )
        }
    }

//MARK: - func{...} for Product View
    
    func CardView(item: Datum) -> some View {
        
        VStack(alignment: .leading, spacing: 1){
            
            //            ZStack(alignment: .top) {
            //
            //                WebImage(url: URL(string: item.thumbnailURL!))
            //                    .resizable()
            //                    .aspectRatio(contentMode: .fit)
            //                    .frame(height: 250)
            //
            //                HStack{
            //
            //                    if item.badges?[0].code == "tikinow" {
            //                        Image("tikinow")
            //                            .resizable()
            //                            .aspectRatio(contentMode: .fit)
            //                            .frame(height: 12, alignment: .leading)
            //                    }
            //
            //                    Spacer()
            //
            //                    Button(action: {
            //
            //                    }) { Image(systemName: "plus")
            //                            .padding(2)
            //                            .foregroundColor(.white)
            //                            .background(Color.pink)
            //                            .clipShape(Circle())
            //                            .frame(height: 8, alignment: .trailing)
            //                    }
            //                }
            //            }
            
            WebImage(url: URL(string: item.thumbnailURL!))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 250)
                .overlay(
                    HStack{
                        
                        if item.badges?[0].code == "tikinow" {
                            Image("tikinow")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                //.frame(height: 12, alignment: .leading)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) { Image(systemName: "plus")
                                .padding(2)
                                .foregroundColor(.white)
                                .background(Color.pink)
                                .clipShape(Circle())
                                //.frame(height: 8, alignment: .trailing)
                        }
                    }
                        .frame(maxWidth: .infinity, maxHeight: 12, alignment: .top)
                        .padding(.top, 3)
                    //                    .padding(.horizontal, 5)
                    ,alignment: .top
                )
            
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
                                .font(.system(size: 7))
                                .foregroundColor(Int(item.ratingAverage!) >= index ? .yellow : .gray.opacity(0.2))
                        }
                    }
                    
                    Text(" (\(Int(item.ratingAverage!)).0) |")
                        .font(.system(size: 8))
                        .foregroundColor(.gray)
                    
                    Text((item.quantitySold?.text)!)
                        .font(.system(size: 9, weight: .bold))
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
