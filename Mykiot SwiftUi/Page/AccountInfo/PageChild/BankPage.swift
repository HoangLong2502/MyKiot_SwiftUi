//
//  BankPage.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 04/08/2023.
//

import SwiftUI

struct BankPage: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var accountInfoVM: AccountInfoViewModel
    
    @State private var showAddCard: Bool = false
    
    var body: some View {
        BaseScaffold(content: {
            return VStack(spacing: Sp.s24) {
                if let listCard = accountInfoVM.accountDetailEntity?.cardBank {
                    ScrollView {
                        ForEach(listCard, id: \.self) { card in
                            ZStack(alignment: .topTrailing) {
                                
                                VStack(alignment: .leading) {
                                    AsyncImage(url: URL(string: card.bankImg!)) { image in
                                        image
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 100)
                                    } placeholder: {
                                        Image(systemName: "creditcard.fill")
                                            .resizable()
                                            .foregroundColor(.white)
                                            .frame(width: 50, height: 25)
                                            .scaledToFit()
                                    }
                                    
                                    HStack {
                                        Image("card_sim")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 50, height: 40)
                                            .foregroundColor(.white)
                                    }
                                    
                                    Spacer()
                                        .frame(height: Sp.s12)
                                    
                                    Text(card.cardNumber!)
                                        .font(.system(size: Sp.s28, weight: .semibold))
                                        .foregroundColor(.white)
                                    
                                    Spacer()
                                        .frame(height: Sp.s16)
                                    
                                    VStack(alignment: .leading) {
                                        Text("Card Holder")
                                            .font(.system(size: Sp.s12, weight: .medium))
                                            .foregroundColor(.white)
                                        Spacer()
                                            .frame(height: Sp.s8)
                                        Text(card.fullName!)
                                            .font(.system(size: Sp.s14, weight: .semibold))
                                            .foregroundColor(.white)
                                    }

                                }
                                .frame(maxWidth: .infinity, alignment: .topLeading)
                            }
                            .padding(Sp.s16)
                            .frame(maxWidth: .infinity)
                            .background {
                                ZStack {
                                    Image("card_bg_img")
                                        .resizable()
                                        .opacity(0.1)
                                        .frame(maxWidth: 150, maxHeight: 300)
                                        .scaledToFill()
                                }
                                .padding(.horizontal, Sp.s16)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
                            }
                            .background(Color.blackSystem)
                            .cornerRadius(Sp.s16)
                            .shadow(color: Color.grey, radius: Sp.s4)
                        }
                    }
                }
                Spacer()
                Button {
                    showAddCard = true
                } label: {
                    HStack {
                        Text("Thêm thẻ")
                            .font(.system(size: Sp.s14, weight: .semibold))
                            .foregroundColor(.white)
                        Spacer()
                            .frame(width: Sp.s8)
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                    }
                    .padding(Sp.s16)
                    .background(Color.main)
                    .cornerRadius(Sp.s48)
                    .shadow(color: Color.grey.opacity(0.3), radius: Sp.s4)
                }
            }
            .padding(.horizontal, Sp.s16)
            .padding(.vertical, Sp.s24)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .sheet(isPresented: $showAddCard) {
                CardCreatePage()
            }
        }, bottomBar: {
            EmptyView()

        }, titleAppBar: "Danh sách thẻ", presentationMode: presentationMode)
        .toolbar(.hidden, for: .navigationBar)
    }
}

struct BankPage_Previews: PreviewProvider {
    static var previews: some View {
        BankPage()
    }
}
