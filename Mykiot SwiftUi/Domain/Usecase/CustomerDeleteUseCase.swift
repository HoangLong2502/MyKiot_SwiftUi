//
//  CustomerDeleteUseCase.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 01/08/2023.
//

import Foundation

class CustomerDeleteUseCase: BaseUseCase {
    typealias I = CustomerDeleteInput
    
    typealias O = CustomerDeleteOutput
    
    private let customerRepository: CustomerRepository = CustomerRepositoryImpl()
    
    func buildUseCase(input: CustomerDeleteInput, complete: ((CustomerDeleteOutput) -> Void)?) {
        customerRepository.deleteCustomer(id: input.id) { res in
            complete?(CustomerDeleteOutput(response: res))
        }
    }
}

class CustomerDeleteInput: BaseInput {
    let id: Int
    
    init(id: Int) {
        self.id = id
    }
}

class CustomerDeleteOutput: BaseOutput {
    let response: BaseResponseModel<String>
    
    init(response: BaseResponseModel<String>) {
        self.response = response
    }
}
