//
//  BankCheckCardUseCase.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 08/08/2023.
//


class BankCheckCardUseCase: BaseUseCase {
    
    typealias I = BankCheckCardInput
    
    typealias O = BankCheckCardOutput
    
    let bankRepository: BankRepository = BankRepositoryImpl()
    
    func buildUseCase(input: BankCheckCardInput, complete: ((BankCheckCardOutput) -> Void)?) {
        let payload = CheckCardPayloadModel(
            bin: input.bin,
            accountNumber: input.accountNumber,
            transferType: input.transferType
        )
        bankRepository.checkCard(payload: payload) { res in
            let output = BankCheckCardOutput(response: res)
            complete?(output)
        }
    }
    
}

struct BankCheckCardInput: BaseInput {
    let bin, accountNumber, transferType: String
    
    init(bin: String, accountNumber: String, transferType: String) {
        self.bin = bin
        self.accountNumber = accountNumber
        self.transferType = transferType
    }
}

struct BankCheckCardOutput: BaseOutput {
    let response: BaseResponseModel<String>
    
    init(response: BaseResponseModel<String>) {
        self.response = response
    }
}
