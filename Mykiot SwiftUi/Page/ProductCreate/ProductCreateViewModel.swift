//
//  ProductCreateViewModel.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 24/07/2023.
//

import Foundation
import _PhotosUI_SwiftUI
import SwiftUI

class ProductCreateViewModel: ObservableObject {
    let productCreateUseCase: ProductCreateUseCase = ProductCreateUseCase()
    
    @Published var barCode: String = ""
    @Published var productName: String = ""
    @Published var priceSell: String = ""
    @Published var priceImport: String = ""
    @Published var description: String = ""
    @Published var imageItem: [PhotosPickerItem] = [PhotosPickerItem]()
    @Published var imageProduct: [Image] = [Image]()
    
    @Published var isLoading: Bool = false
    @Published var isDismiss: Bool = false
    
    func onImageChange(listImage: [PhotosPickerItem]) {
        self.imageProduct.removeAll()
        
        for item in listImage {
            item.loadTransferable(type: Data.self) { res in
                guard let data = try? res.get() else {
                    return
                }
                guard let uiImage = UIImage(data: data) else {
                    return
                }
                let image = Image(uiImage: uiImage)
                
                DispatchQueue.main.async {
                    self.imageProduct.append(image)
                }
            }
        }
    }
    
    func createProduct() {
        isLoading = true
        let input = ProductCreateInput(barCode: barCode, productName: productName, priceSell: priceSell, priceImport: priceImport, description: description, imageProduct: imageItem)
        productCreateUseCase.buildUseCase(input: input) { res in
            print("-----------\(res.response.statusCode ?? 400)")
            self.isLoading = false
            self.isDismiss = true
        }
    }
}
