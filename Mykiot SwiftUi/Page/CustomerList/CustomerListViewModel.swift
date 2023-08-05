//
//  CustomerListViewModel.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 31/07/2023.
//

import SwiftUI

class CustomerListViewModel: ObservableObject {
    @Published var searchKey: String = ""
    @Published var listCustomer: [CustomerEntity] = [CustomerEntity]()
    @Published var idCardCustomerFocus: Int?
    
    private let customerGetListUseCase: CustomerGetListUseCase = CustomerGetListUseCase()
    private let customerDeleteUseCase: CustomerDeleteUseCase = CustomerDeleteUseCase()
    
    func getList(page: Int, limit: Int, search: String) {
        let input = CustomerGetListInput(
            page: page,
            limit: limit,
            search: search
        )
        customerGetListUseCase.buildUseCase(input: input) { res in
            guard let customerEntity = res.response.data else {
                return
            }
            
            self.listCustomer = customerEntity
        }
    }
    
    func deleteCustomer(_ id: Int) {
        let input = CustomerDeleteInput(id: id)
        customerDeleteUseCase.buildUseCase(input: input) { res in
            if res.response.statusCode == 200 {
                if let index = self.listCustomer.firstIndex(where: { item in
                    return item.id == id
                }) {
                    self.listCustomer.remove(at: index)
                }
            }
        }
    }
}
