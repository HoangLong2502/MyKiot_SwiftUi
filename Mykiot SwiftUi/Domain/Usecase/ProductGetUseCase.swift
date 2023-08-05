//
//  ProductGetUseCase.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 24/07/2023.
//

import Foundation

class ProductGetUseCase: BaseUseCase {
    let productRepository: ProductRepository = ProductRepositoryImpl()
    let productMapper: ProductMapper = ProductMapper()
    
    typealias I = ProductGetInput
    
    typealias O = ProductGetOuput
    
    func buildUseCase(input: ProductGetInput, complete: ((ProductGetOuput) -> Void)?) {
        productRepository.getList { response in
            let listProductEntity = self.productMapper.mapToListEntity(listData: response.data)
            let output = ProductGetOuput(response: BaseResponseModel(
                statusCode: response.statusCode,
                message: response.message,
                data: listProductEntity
            ))
            complete?(output)
        }
    }
}

class ProductGetInput: BaseInput {
    
}

class ProductGetOuput: BaseOutput {
    let response: BaseResponseModel<[ProductEntity]>
    
    init(response: BaseResponseModel<[ProductEntity]>) {
        self.response = response
    }
}
