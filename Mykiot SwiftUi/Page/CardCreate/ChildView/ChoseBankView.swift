//
//  ChoseBankView.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 07/08/2023.
//

import SwiftUI

struct ChoseBankView: View {
    @EnvironmentObject private var cardCreateVM: CardCreateViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Vui lòng chọn ngân hàng của bạn ...")
                .font(.system(size: Sp.s24, weight: .semibold))
                .foregroundColor(Color.blackSystem)
            
            Spacer()
                .frame(height: Sp.s24)
            
            ScrollView {
                VStack(alignment: .leading, spacing: Sp.s16) {
                    ForEach(cardCreateVM.listBank, id: \.self) {item in
                        HStack() {
                            if let image = item.imgUrl {
                                AsyncImage(url: URL(string: image)) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: Sp.s56, height: Sp.s56)
                                        .clipShape(Circle())
                                        .overlay {
                                            Circle().stroke(Color.border_2)
                                        }
                                } placeholder: {
                                    Image(systemName: "creditcard.fill")
                                        .resizable()
                                        .foregroundColor(Color.grey)
                                        .scaledToFit()
                                        .frame(width: Sp.s56, height: Sp.s56)
                                        .clipShape(Circle())
                                        .overlay {
                                            Circle().stroke(Color.border_2)
                                        }
                                }
                            }
                            
                            Spacer()
                                .frame(width: Sp.s12)
                            
                            Text(item.title ?? "")
                                .font(.system(size: Sp.s16, weight: .semibold))
                                .foregroundColor(Color.blackSystem)

                        }
                        .gesture(
                            TapGesture()
                                .onEnded({ _ in
                                    cardCreateVM.choseBank(item)
                                })
                        )
                    }
                }
                .frame(maxWidth: .infinity, alignment: .topLeading)
            }
        }
        .padding(.horizontal, Sp.s16)
        .padding(.vertical, Sp.s24)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .onAppear() {
            cardCreateVM.getListBank()
        }
    }
}

//struct ChoseBankView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChoseBankView()
//    }
//}
