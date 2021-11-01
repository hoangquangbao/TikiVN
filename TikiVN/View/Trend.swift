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
        .padding(4)
        .padding(.bottom, 15)
            
            
            
            
        }
        //.ignoresSafeArea()
    
        
    }

//MARK: - func{...} for Category Tab

    func Category(item: Item) -> some View {
        
        Button {
            
        } label: {
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
    
    //MARK: - func{...} for Product View
        
        func CardView(item: Datum) -> some View {
            
            VStack(alignment: .leading, spacing: 1){
                
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

struct Trend_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

