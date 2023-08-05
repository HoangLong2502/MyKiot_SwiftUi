//
//  AccountDetailUseCase.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 05/08/2023.
//

import Foundation

class AccountDetailUseCase: BaseUseCase {
    
    typealias I = AccountDetailInput
    
    typealias O = AccountDetailOutput
    
    let accountRepository: AccountRepository = AccountRepositoryImpl()
    let accountDetailMapper: AccountDetailMapper = AccountDetailMapper()
    
    func buildUseCase(input: AccountDetailInput, complete: ((AccountDetailOutput) -> Void)?) {
        accountRepository.getDetail { res in
            let dataEntity = self.accountDetailMapper.mapToEntity(data: res.data)
            let output = AccountDetailOutput(response: BaseResponseModel(
                statusCode: res.statusCode,
                message: res.message,
                data: dataEntity
            ))
            
            complete?(output)
        }
    }
}

struct AccountDetailInput: BaseInput {
    
}

struct AccountDetailOutput: BaseOutput {
    let response: BaseResponseModel<AccountDetailEntity>
    
    init(response: BaseResponseModel<AccountDetailEntity>) {
        self.response = response
    }
}
