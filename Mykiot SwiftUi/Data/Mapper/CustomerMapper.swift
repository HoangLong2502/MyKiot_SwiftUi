//
//  CustomerMapper.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 31/07/2023.
//

import Foundation

class CustomerMapper: BaseDataMapper {
    
    typealias I = CustomerResponseModel
    
    typealias M = CustomerEntity
    
    func mapToEntity(data: CustomerResponseModel?) -> CustomerEntity {
        return CustomerEntity(
            id: data?.id,
            fullName: data?.fullName,
            phone: data?.phone,
            image: data?.image
        )
    }
}
