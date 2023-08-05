//
//  ProductViewModel.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 23/07/2023.
//

import Foundation
import SwiftUI

class ProductViewModel: ObservableObject {
    
    let productUseCase: ProductGetUseCase = ProductGetUseCase()
    
    @Published var searchText: String = ""
    @Published var listProduct: [ProductEntity] = []
    
    func getListProduct() {
        let input = ProductGetInput()
        productUseCase.buildUseCase(input: input) { res in
            self.listProduct = res.response.data ?? []
        }
    }
}
