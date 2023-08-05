//
//  CustomerCreateUseCase.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 03/08/2023.
//

import Foundation


class CustomerCreateUseCase: BaseUseCase {

    typealias I = CustomerCreateInput
    
    typealias O = CustomerCreateOutput
    
    let customerRepository: CustomerRepository = CustomerRepositoryImpl()
    let customerMapper: CustomerMapper = CustomerMapper()
    
    func buildUseCase(input: CustomerCreateInput, complete: ((CustomerCreateOutput) -> Void)?) {
        customerRepository.create(avatar: input.avatar, payload: input.payload) { res in
            let dataEntity = self.customerMapper.mapToEntity(data: res.data)
            let ouput = CustomerCreateOutput(response: BaseResponseModel(
                statusCode: res.statusCode,
                message: res.message,
                data: dataEntity
            ))
            complete?(ouput)
        }
    }
}

class CustomerCreateInput: BaseInput {
    let avatar: Data?
    let payload: CustomerDataPayloadModel
    
    init(avatar: Data? = nil, payload: CustomerDataPayloadModel) {
        self.avatar = avatar
        self.payload = payload
    }
}

class CustomerCreateOutput: BaseOutput {
    let response: BaseResponseModel<CustomerEntity>
    
    init(response: BaseResponseModel<CustomerEntity>) {
        self.response = response
    }
}
