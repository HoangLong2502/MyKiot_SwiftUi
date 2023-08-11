//
//  CardCreatePage.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 07/08/2023.
//

import SwiftUI

struct CardCreatePage: View {
    @Environment(\.dismiss) private var dismiss
    
    @StateObject var cardCreateVM = CardCreateViewModel()
    
    var body: some View {
        VStack {
            if cardCreateVM.stepCreateCard == .choseBank {
                ChoseBankView()
                    .environmentObject(cardCreateVM)
            } else if cardCreateVM.stepCreateCard == .numberCard {
                TypingNumberCard(parentDismiss: dismiss)
                    .environmentObject(cardCreateVM)
            } else {
                EmptyView()
            }
        }
        .onChange(of: cardCreateVM.bankSelected) { newValue in
            withAnimation {
                if newValue != nil {
                    cardCreateVM.stepCreateCard = .numberCard
                }
            }
        }
    }
}

struct CardCreatePage_Previews: PreviewProvider {
    static var previews: some View {
        CardCreatePage()
    }
}
