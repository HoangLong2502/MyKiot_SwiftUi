//
//  BankListUseCase.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 07/08/2023.
//

import Foundation

class BankListUseCase: BaseUseCase {
    
    typealias I = BankListInput
    
    typealias O = BankListOutput
    
    let bankRepository: BankRepository = BankRepositoryImpl()
    let bankMapper: BankEntityMapper = BankEntityMapper()
    
    func buildUseCase(input: BankListInput, complete: ((BankListOutput) -> Void)?) {
        bankRepository.listBank { res in
            let dataEntity = self.bankMapper.mapToListEntity(listData: res.data)
            let output = BankListOutput(response: BaseResponseModel(
                statusCode: res.statusCode,
                message: res.message,
                data: dataEntity
            ))
            complete?(output)
        }
    }
}

struct BankListInput: BaseInput {
    
}

struct BankListOutput: BaseOutput {
    let response: BaseResponseModel<[BankEntity]>
    
    init(response: BaseResponseModel<[BankEntity]>) {
        self.response = response
    }
}
