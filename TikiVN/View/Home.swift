//
//  Home.swift
//  TikiVN
//
//  Created by Quang Bao on 30/10/2021.
//

import SwiftUI
/*
    @EnvironmentObject var baseViewModel : HomeViewModel
    var prd : [Datum] = []

        VStack {
            ForEach(baseViewModel.product!, id: \.self){prd in
                Text(prd.name!)
            }
        }
*/

struct Home: View {
    
    @EnvironmentObject var baseViewModel : HomeViewModel
    
    let product : [Datum]? = Bundle.main.fetchData()
    
    
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
            
            
//            contents = baseViewModel.product
            //Product View
            
//            do {
//
//                guard var contents = baseViewModel.product else { break }
//
//            } catch {
//
//                break
//            }
            
//            if var contents = product  {
//
//            let columns = Array(repeating: GridItem(.flexible(), spacing: 10), count: 2)
//
//            ScrollView(.vertical, showsIndicators: false){
//                //Grid View....
//                LazyVGrid(columns: columns, spacing: 10) {
//
//                    //Product....
//                    ForEach(product){product in
//                        CardView(product: product)
//                    }
//
//                }
//                .padding()
//                .padding(.bottom,30)
//            }
//        }
            

            let columns = Array(repeating: GridItem(.flexible(), spacing: 10), count: 2)
            
            ScrollView(.vertical, showsIndicators: false){
                //Grid View....
                LazyVGrid(columns: columns, spacing: 10) {
                    
                    //Product....
                    ForEach(product!){product in
                        CardView(product: product)
                    }
                    
                }
                .padding()
                .padding(.bottom,30)
            }
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
