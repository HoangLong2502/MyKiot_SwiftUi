//
//  CardCreateViewModel.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 07/08/2023.
//

import Foundation
import SwiftUI

class CardCreateViewModel: ObservableObject {
    
    let bankListUseCase: BankListUseCase = BankListUseCase()
    let bankCheckCardUseCase: BankCheckCardUseCase = BankCheckCardUseCase()
    let bankCreateCardUseCase: BankCreateCardUseCase = BankCreateCardUseCase()
    
    let onComplete: (() -> Void)?
    
    init(onComplete: (() -> Void)? = nil) {
        self.onComplete = onComplete
    }
    
    @Published var listBank: [BankEntity] = [BankEntity]()
    @Published var bankSelected: BankEntity?
    @Published var stepCreateCard: StepCreateCard = .choseBank
    @Published var cardHolder: String = ""
    @Published var cardNumber: String = ""
    
    @Published var isLoadingCheckCard: Bool = false
    
    func getListBank() {
        let input = BankListInput()
        bankListUseCase.buildUseCase(input: input) { res in
            guard let banks = res.response.data else {
                return
            }
            self.listBank = banks
        }
    }
    
    func checkCard() {
        guard let bin = bankSelected?.bin else {
            return
        }
        isLoadingCheckCard = true
        let input = BankCheckCardInput(bin: bin, accountNumber: cardNumber, transferType: "NAPAS")
        bankCheckCardUseCase.buildUseCase(input: input) { res in
            guard let data = res.response.data else {
                return
            }
            self.isLoadingCheckCard = false
            self.cardHolder = data
        }
    }
    
    func createCard(_ onComplete: (() -> Void)?) {
        isLoadingCheckCard = true
        let input = BankCreateCardInput(
            cardNumber: cardNumber,
            fullName: cardHolder,
            cvv: nil,
            expriryDate: nil,
            status: true,
            cardType: 1,
            bank: bankSelected?.id
        )
        
        bankCreateCardUseCase.buildUseCase(input: input) { response in
            self.isLoadingCheckCard = false
            
            if response.response.statusCode == 200 {
                onComplete?()
            }
        }
    }
}

extension CardCreateViewModel {
    func choseBank(_ bank: BankEntity) {
        bankSelected = bank
    }
}

enum StepCreateCard {
    case choseBank
    case numberCard
    case createCard
}
