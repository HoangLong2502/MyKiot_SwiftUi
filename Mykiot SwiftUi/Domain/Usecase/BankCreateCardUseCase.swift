//
//  BankCreateCardUseCase.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 08/08/2023.
//

import Foundation

class BankCreateCardUseCase: BaseUseCase {
    
    typealias I = BankCreateCardInput
    
    typealias O = BankCreateCardOutput
    
    let bankRepository: BankRepository = BankRepositoryImpl()
    let bankCardMapper: CardBankEntityMapper = CardBankEntityMapper()
    
    func buildUseCase(input: BankCreateCardInput, complete: ((BankCreateCardOutput) -> Void)?) {
        let payload = CreateCardPayloadModel(
            cardNumber: input.cardNumber,
            fullName: input.fullName,
            status: input.status,
            cvv: input.cvv,
            expriryDate: input.expriryDate,
            cardType: input.cardType,
            bank: input.bank
        )
        
        bankRepository.createCard(payload: payload) { res in
            let data = self.bankCardMapper.mapToEntity(data: res.data)
            let output = BankCreateCardOutput(response: BaseResponseModel(
                statusCode: res.statusCode,
                message: res.message,
                data: data
            ))
            complete?(output)
        }
    }
}

class BankCreateCardInput: BaseInput {
    let cardNumber, fullName, cvv, expriryDate: String?
    let status: Bool?
    let cardType, bank: Int?
    
    init(cardNumber: String?, fullName: String?, cvv: String?, expriryDate: String?, status: Bool?, cardType: Int?, bank: Int?) {
        self.cardNumber = cardNumber
        self.fullName = fullName
        self.cvv = cvv
        self.expriryDate = expriryDate
        self.status = status
        self.cardType = cardType
        self.bank = bank
    }
}

class BankCreateCardOutput: BaseOutput {
    let response: BaseResponseModel<CardBankEntity>
    
    init(response: BaseResponseModel<CardBankEntity>) {
        self.response = response
    }
}
