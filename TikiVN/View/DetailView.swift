//
//  DetailView.swift
//  TikiVN
//
//  Created by Quang Bao on 02/11/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
    
    @EnvironmentObject var baseData: HomeViewModel
    var animation: Namespace.ID
    var body: some View {
        
        //SafeCheck....
        if let item = baseData.currentProduct, baseData.showDetail{
            
            VStack(spacing: 10){
                
                HStack{
                    Button {
                        withAnimation{baseData.showDetail = false}
                    } label: {
                        
                        Image(systemName: "arrow.backward")
                            .font(.system(size: 25, weight: .bold))
                            .foregroundColor(.black)
                            .padding(6)
                            .background(.white,in: Circle())
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        
                        Image(systemName: "line.3.horizontal")
                            .font(.system(size: 22))
                            .foregroundColor(.black)
                    }
                }
                .padding(.horizontal)
                
                GeometryReader{geo in
                    WebImage(url: URL(string: item.thumbnailURL!))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geo.size.width, height: geo.size.height)
                    //.edgesIgnoringSafeArea(.top)
                        .matchedGeometryEffect(id: item.id, in: animation)
                }
                
                VStack(alignment: .leading, spacing: 10){
                    
                    Text(item.name!)
                        .font(.system(size: 20, weight: .bold))
                    
                    HStack{
                        
                        ForEach(1...5, id: \.self){index in
                            Image(systemName: "star.fill")
                                .font(.system(size: 15))
                                .foregroundColor(Int(item.ratingAverage!) >= index ? .yellow : .gray.opacity(0.2))
                        }
                        
                        Text(" (\(Int(item.ratingAverage!)).0)")
                            .font(.system(size: 15))
                            .font(.caption.bold())
                            .foregroundColor(.gray)
                        
                        Spacer(minLength: 10)
                        
                        Text("\(item.price!) đ")
                            .font(.title2.bold())
                    }
                    
                    Text("Description")
                    
                    Text(item.shortDescription!)
                        .lineLimit(7)
                        .foregroundColor(.gray.opacity(0.9))
                }
                .padding()
                .background(
                    Color.white
                )
                .cornerRadius(30)
                .offset(y: -20)
                
                
                HStack{
                    Button(action: {}, label: {
                        Text("View Cart")
                            .font(.system(size: 15, weight: .bold))
                            .foregroundColor(.white)
                            .frame(width: 130, height: 40, alignment: .center)
                            .background(.gray, in: RoundedRectangle(cornerRadius: 12))
                    })
                    
                    Spacer(minLength: 30)
                    
                    Button(action: {}, label: {
                        Text("Add to Cart")
                            .font(.system(size: 15, weight: .bold))
                            .foregroundColor(.white)
                            .frame(width: 130, height: 40, alignment: .center)
                            .background(.pink, in: RoundedRectangle(cornerRadius: 12))
                    })
                }
                .padding(.horizontal)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(.white)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
