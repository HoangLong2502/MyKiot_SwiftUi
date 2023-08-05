//
//  ProductMapper.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 24/07/2023.
//

import Foundation

class ProductMapper: BaseDataMapper {
    
    typealias I = ProductResponseModel
    
    typealias M = ProductEntity
    
    func mapToEntity(data: ProductResponseModel?) -> ProductEntity {
        return ProductEntity(
            title: data?.title,
            code: data?.code,
            priceSell: data?.priceSell,
            image: (data?.mediaData ?? []).map { imageData -> String in
                return imageData.image ?? ""
            }
        )
    }
}
