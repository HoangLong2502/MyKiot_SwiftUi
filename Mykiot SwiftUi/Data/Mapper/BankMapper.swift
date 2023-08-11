//
//  BankMapper.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 07/08/2023.
//

import Foundation

class BankEntityMapper: BaseDataMapper {
    
    typealias I = BankModel
    
    typealias M = BankEntity
    
    func mapToEntity(data: BankModel?) -> BankEntity {
        return BankEntity(
            id: data?.id,
            title: data?.title,
            code: data?.code,
            shortName: data?.shortName,
            imgUrl: data?.imgURL,
            bin: data?.bin,
            swiftCode: data?.swiftCode
        )
    }
}
