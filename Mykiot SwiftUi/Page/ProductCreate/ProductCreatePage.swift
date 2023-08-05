//
//  ProductCreatePage.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 24/07/2023.
//

import SwiftUI
import PhotosUI
struct ProductCreatePage: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    
    @StateObject var productCreateVM: ProductCreateViewModel = ProductCreateViewModel()
    @State var isExpanded = true
    
    var body: some View {
        BaseLoading(isShowing: $productCreateVM.isLoading) {
            NavigationView {
                VStack {
                    BaseAppBar(title: "Tạo sản phẩm", presentationMode: presentationMode)

                    ScrollView {
                        // MARK: Image Product Picker
                        VStack(alignment: .leading) {
                            Text("Ảnh sản phẩm")
                                .font(.system(size: Sp.s18, weight: .medium))
                            Spacer()
                                .frame(height: Sp.s24)
                            HStack {
                                ZStack {
                                    Rectangle()
                                        .strokeBorder(style: StrokeStyle( lineWidth: 1, dash: [5]))
                                        .foregroundColor(Color.main)
                                    .cornerRadius(Sp.s8)
                                    
                                    Text("Tải ảnh lên")
                                        .font(.system(size: Sp.s14, weight: .medium))
                                        .foregroundColor(Color.main)
                                }
                                .frame(maxWidth: .infinity, maxHeight: 46)
                                
                                Spacer()
                                    .frame(width: Sp.s16)
                                
                                VStack {
                                    PhotosPicker(selection: $productCreateVM.imageItem, matching: .images) {
                                        Image(systemName: "camera.fill")
                                            .resizable()
                                            .frame(width: Sp.s16, height: Sp.s16)
                                            .foregroundColor(Color.main)
                                    }
                                    .onChange(of: productCreateVM.imageItem) { newValue in
                                        productCreateVM.onImageChange(listImage: newValue)
                                    }
                                }
                                .frame(width: 46, height: 46)
                                .overlay(
                                    RoundedRectangle(cornerRadius: Sp.s8)
                                        .stroke(Color.main, lineWidth: 1)
                                )
                            }
                            
                            if !productCreateVM.imageProduct.isEmpty {
                                Spacer()
                                    .frame(height: Sp.s16)
                                HStack {
                                    ForEach(0..<productCreateVM.imageProduct.count, id: \.self) { index in
                                        productCreateVM.imageProduct[index]
                                            .resizable()
                                            .frame(width: Sp.s48, height: Sp.s48)
                                            .clipShape(RoundedRectangle(cornerRadius: Sp.s8))
                                    }
                                }
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .padding(Sp.s24)
                        .background(.white)
                        .cornerRadius(Sp.s8)
                        .padding(.horizontal, Sp.s16)
                        
                        //MARK: Product Info
                        Spacer()
                            .frame(height: Sp.s16)
                        VStack {
                            HStack {
                                Text("Thông tin sản phẩm")
                                    .font(.system(size: Sp.s18, weight: .medium))
                                Spacer()
                                Image(systemName: "arrowtriangle.up.fill")
                                    .foregroundColor(Color.grey)
                            }
                            .padding(Sp.s16)
                            .onTapGesture {
                                withAnimation {
                                    isExpanded.toggle()
                                }
                            }
                            
                            if isExpanded {
                                VStack {
                                    Divider()
                                    Spacer()
                                        .frame(height: Sp.s16)
                                    HStack(alignment: .bottom) {
                                        BaseTextField(label: "Mã vạch", hint: "Nhập mã vạch", value: $productCreateVM.barCode)
                                        Spacer()
                                            .frame(width: Sp.s16)
                                        HStack {
                                            NavigationLink {
                                                ProductScanPage { value in
                                                    if let barCode = value {
                                                        productCreateVM.barCode = barCode
                                                    }
                                                }
                                            } label: {
                                                Image(systemName: "barcode.viewfinder")
                                                    .foregroundColor(Color.main)
                                            }

                                        }
                                        .padding(Sp.s14)
                                        .overlay(RoundedRectangle(cornerRadius: Sp.s8).stroke(Color.main))
                                    }
                                    Spacer()
                                        .frame(height: Sp.s16)
                                    BaseTextField(label: "Tên sản phẩm", hint: "Nhập tên sản phẩm", value: $productCreateVM.productName)
                                    Spacer()
                                        .frame(height: Sp.s16)
                                    BaseTextField(label: "Giá bán", hint: "Nhập giá bán", keyboardType: .numberPad, value: $productCreateVM.priceSell)
                                    Spacer()
                                        .frame(height: Sp.s16)
                                    BaseTextField(label: "Giá nhập", hint: "Nhập giá nhập", keyboardType: .numberPad, value: $productCreateVM.priceImport)
                                    Spacer()
                                        .frame(height: Sp.s16)
                                }
                                .padding(.horizontal, Sp.s24)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .cornerRadius(Sp.s8)
                        .padding(.horizontal, Sp.s16)
                        
                        //MARK: Product Info
                        Spacer()
                            .frame(height: Sp.s16)
                        VStack(alignment: .leading) {
                            BaseTextField(label: "Mô tả sản phẩm", hint: "Nhập mô tả", value: $productCreateVM.description)
                        }
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .padding(Sp.s24)
                        .background(.white)
                        .cornerRadius(Sp.s8)
                        .padding(.horizontal, Sp.s16)
                    }
                    
                    HStack {
                        BaseButton(title: "Huỷ") {
                            productCreateVM.isDismiss = true
                        }
                        Spacer()
                            .frame(width: Sp.s16)
                        BaseButton(title: "Tạo sản phẩm") {
                            productCreateVM.createProduct()
                        }
                    }
                    .padding(Sp.s16)
                    .background(.white)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .background(Color.bg_4)
            }
            .toolbar(.hidden, for: .navigationBar)
            .onChange(of: productCreateVM.isDismiss) { newValue in
                if newValue {
                    dismiss()
                }
            }
        }
    }
}

struct ProductCreatePage_Previews: PreviewProvider {
    static var previews: some View {
        ProductCreatePage()
    }
}
