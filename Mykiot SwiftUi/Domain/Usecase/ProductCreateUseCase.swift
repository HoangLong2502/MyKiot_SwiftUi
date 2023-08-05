//
//  ProductCreateUseCase.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 24/07/2023.
//

import Foundation
import Alamofire
import _PhotosUI_SwiftUI

class ProductCreateUseCase: BaseUseCase {
    let productRepository: ProductRepository = ProductRepositoryImpl()
    
    func buildUseCase(input: ProductCreateInput, complete: ((ProductCreateOutput) -> Void)?) {
        guard let productJsonString = try? ProductPayloadModel(
            product: Product(
                title: input.productName,
                barcode: input.barCode,
                priceSell: Int(input.priceSell ?? "0"),
                priceImport: Int(input.priceImport ?? "0"),
                description: input.description,
                statusProduct: true,
                statusOnline: true
            ),
            variant: [
                Variant(
                    title: input.productName,
                    barcode: input.barCode,
                    priceSell: Int(input.priceSell ?? "0"),
                    priceImport: Int(input.priceImport ?? "0"),
                    quantity: 100
                )
            ]
        ).jsonString() else {
            return
        }
        
        Task {
            var imageData = [Data]()
            
            if let imageProduct = input.imageProduct {
                for item in imageProduct {
                    guard let data = try await item.loadTransferable(type: Data.self) else {
                        return
                    }
//                    guard let data = try? res.get() else {
//                        return
//                    }
                    imageData.append(data)
//                    { res in
//                        guard let data = try? res.get() else {
//                            return
//                        }
//
//                        imageData.append(data)
//                    }
                }
            }
            
            let payload = [
                "data" : productJsonString,
            ]
            
            let formData: MultipartFormData = MultipartFormData()
            
            if let productData = productJsonString.data(using: .utf8) {
                formData.append(productData, withName: "data")
            }
            productRepository.create(imageData: imageData, payload: payload) { res in
                complete?(ProductCreateOutput(response: res))
            }
        }
    }
    
    typealias I = ProductCreateInput
    
    typealias O = ProductCreateOutput
    
}

class ProductCreateInput: BaseInput {
    let barCode: String?
    let productName: String?
    let priceSell: String?
    let priceImport: String?
    let description: String?
    let imageProduct: [PhotosPickerItem]?
    
    init(barCode: String?, productName: String?, priceSell: String?, priceImport: String?, description: String?, imageProduct: [PhotosPickerItem]?) {
        self.barCode = barCode
        self.productName = productName
        self.priceSell = priceSell
        self.priceImport = priceImport
        self.description = description
        self.imageProduct = imageProduct
    }
}

class ProductCreateOutput: BaseOutput {
    let response: BaseResponseModel<ProductResponseModel>
    
    init(response: BaseResponseModel<ProductResponseModel>) {
        self.response = response
    }
}
