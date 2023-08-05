//
//  ProductPage.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 23/07/2023.
//

import SwiftUI

struct ProductPage: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var productVM: ProductViewModel = ProductViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                BaseAppBar(title: "Quản lý sản phẩm", presentationMode: presentationMode)
                
                ScrollView {
                    VStack {
                        NavigationLink(destination: ProductCreatePage()) {
                            HStack {
                                Text("Tạo sản phẩm")
                                    .font(.system(size: Sp.s14, weight: .medium))
                                    .foregroundColor(.white)
                            }
                            .padding(Sp.s16)
                            .frame(maxWidth: .infinity)
                            .background(Color.main)
                            .cornerRadius(Sp.s8)
                        }
                        
                        
//                        BaseButton(title: "Tạo sản phẩm") {
//                            navigation.toggle()
//                        }
//                        .transition(.move(edge: .trailing))
//                        .fullScreenCover(isPresented: $navigation, content: {
//                            ProductCreatePage()
//                        })
                        
                        Spacer()
                            .frame(height: Sp.s24)
                        
                        BaseTextField(label: nil, hint: "Nhập tên sản phẩm", value: $productVM.searchText)
                        
                        Spacer()
                            .frame(height: Sp.s24)
                        
                        LazyVStack(spacing: Sp.s16) {
                            ForEach(productVM.listProduct, id: \.self) { item in
                                CardProductView(
                                    product: item
                                )
                            }
                        }
                    }
                    .padding(.vertical, Sp.s24)
                .padding(.horizontal, Sp.s16)
                }
                .onAppear() {
                    productVM.getListProduct()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .background(Color.bg_4)
            .toolbar(.hidden, for: .navigationBar)
        }.toolbar(.hidden, for: .navigationBar)
    }
}

struct ProductPage_Previews: PreviewProvider {
    static var previews: some View {
        ProductPage()
    }
}
