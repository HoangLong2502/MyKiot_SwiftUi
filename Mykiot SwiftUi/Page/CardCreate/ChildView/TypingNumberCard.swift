//
//  TypingNumberCard.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 07/08/2023.
//

import SwiftUI

struct TypingNumberCard: View {
    @EnvironmentObject var cardCreateVM: CardCreateViewModel
    let parentDismiss: DismissAction
    
    var body: some View {
        BaseLoading(isShowing: $cardCreateVM.isLoadingCheckCard) {
            VStack(alignment: .leading) {
                VStack {
                    VStack(alignment: .leading) {
                        Text("Card Holder")
                            .font(.system(size: Sp.s16, weight: .regular))
                            .foregroundColor(.white)
                        Spacer()
                            .frame(height: Sp.s8)
                        Text(!cardCreateVM.cardHolder.isEmpty ? cardCreateVM.cardHolder : "----------")
                            .font(.system(size: Sp.s24, weight: .semibold))
                            .foregroundColor(.white)
                    }
                    .padding(Sp.s24)
                    .frame(maxWidth: .infinity, maxHeight: 150, alignment: .topLeading)
                    .overlay {
                        VStack {
                            Spacer()
                            Text(cardCreateVM.bankSelected?.title ?? "")
                                .font(.system(size: 90, weight: .bold))
                                .foregroundColor(.white.opacity(0.1))
                                .frame(width: 1000)
                        }
                        .offset(y: Sp.s32)
                    }
                    
                    HStack {
                        Text(!cardCreateVM.cardNumber.isEmpty ? cardCreateVM.cardNumber : "----------")
                            .font(.system(size: Sp.s14, weight: .medium))
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Image(systemName: "creditcard.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: Sp.s32)
                            .foregroundColor(.white)
                    }
                    .padding(Sp.s24)
                    .frame(maxWidth: .infinity)
                    .background(Color.main)
                }
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .background(Color.blackSystem)
                .clipShape(RoundedRectangle(cornerRadius: Sp.s16))
                .shadow(radius: Sp.s4)
                
                Spacer()
                    .frame(height: Sp.s32)
                
                Text("Nhập thông tin thẻ")
                    .font(.system(size: Sp.s18, weight: .semibold))
                    .foregroundColor(.blackSystem)
                
                Spacer()
                    .frame(height: Sp.s24)
                
                BaseTextField(
                    label: "Số thẻ / Số tài khoản",
                    hint: "Nhập số thẻ / số tài khoản",
                    keyboardType: .numberPad,
                    value: $cardCreateVM.cardNumber
                )
                
                Spacer()
                    .frame(height: Sp.s16)
                
                BaseTextField(
                    label: "Chủ thẻ",
                    hint: "Họ và tên chủ thẻ",
                    value: $cardCreateVM.cardHolder
                )
                
                Spacer()
                
                Button {
                    if cardCreateVM.cardHolder.isEmpty {
                        cardCreateVM.checkCard()
                    } else {
                        cardCreateVM.createCard {
                            parentDismiss()
                        }
                    }
                } label: {
                    Text(cardCreateVM.cardHolder.isEmpty ? "Xác thực" : "Thêm thẻ")
                        .font(.system(size: Sp.s14, weight: .semibold))
                        .foregroundColor(Color.white)
                }
                .padding(Sp.s16)
                .frame(maxWidth: .infinity)
                .background(Color.main)
                .cornerRadius(Sp.s12)

                
    //            BaseTextField(label: "Chủ thẻ", value: $cardCreateVM.cardNumber)
            }
            .padding(.horizontal, Sp.s16)
            .padding(.vertical, Sp.s24)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .background(Color.bg_4)
        }
    }
}

//struct TypingNumberCard_Previews: PreviewProvider {
//    static var previews: some View {
//        TypingNumberCard()
//    }
//}
