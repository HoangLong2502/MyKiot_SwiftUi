//
//  HomeViewModel.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 19/07/2023.
//

import Foundation
import UIKit

class HomeViewModel: ObservableObject {
    @Published var listNewOrder: [OrderEntity] = []
    
    let orderUseCase: OrderUseCase = OrderUseCase()
    
    func getListOrder() {
        let input = OrderInput()
        orderUseCase.buildUseCase(input: input) { response in
            print("-------\(response.response.statusCode)")
            self.listNewOrder = response.response.data ?? []
        }
    }
}
