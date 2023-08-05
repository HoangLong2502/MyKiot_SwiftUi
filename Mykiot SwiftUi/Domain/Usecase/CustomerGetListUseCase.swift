//
//  CustomerUseCase.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 31/07/2023.
//

import Foundation

class CustomerGetListUseCase: BaseUseCase {
    
    typealias I = CustomerGetListInput
    
    typealias O = CustomerGetListOutput
    
    let customerMapper: CustomerMapper = CustomerMapper()
    let customerRepository: CustomerRepository = CustomerRepositoryImpl()
    
    func buildUseCase(input: CustomerGetListInput, complete: ((CustomerGetListOutput) -> Void)?) {
        customerRepository.getList(page: input.page, limit: input.limit) { res in
            if res.statusCode == 200 {
                let customerEntities = self.customerMapper.mapToListEntity(listData: res.data)
                complete?(CustomerGetListOutput(response: BaseResponseModel<[CustomerEntity]>(
                    statusCode: res.statusCode,
                    message: res.message,
                    data: customerEntities
                )))
            } else {
                complete?(CustomerGetListOutput(response: BaseResponseModel<[CustomerEntity]>(
                    statusCode: 400,
                    message: res.message
                )))
            }
        }
    }
}

struct CustomerGetListInput: BaseInput {
    let page: Int
    let limit: Int
    let search: String
    
    init(page: Int = 0, limit: Int = 10, search: String = "") {
        self.page = page
        self.limit = limit
        self.search = search
    }
}

struct CustomerGetListOutput: BaseOutput {
    let response: BaseResponseModel<[CustomerEntity]>
    
    init(response: BaseResponseModel<[CustomerEntity]>) {
        self.response = response
    }
}
