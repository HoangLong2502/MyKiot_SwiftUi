//
//  AccountInfoPage.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 03/08/2023.
//

import SwiftUI

struct AccountInfoPage: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var accountInfoVM: AccountInfoViewModel = AccountInfoViewModel()
    
    @EnvironmentObject var authenVM: AuthenViewModel
    
    var body: some View {
        VStack {
            // MARK: - App Bar
            BaseAppBar(title: "Tài khoản", presentationMode: presentationMode)
            
            // MARK: - Body
            VStack {
                
                // MARK: - Avatar
                ZStack(alignment: .bottomTrailing) {
                    AsyncImage(url: URL(string: accountInfoVM.accountDetailEntity?.avatar ??  "https://thongtinkpop.com/wp-content/uploads/2021/05/han-so-hee-profile.jpg")) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                    } placeholder: {
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .foregroundColor(Color.grey)
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                    }
                    
                    ZStack {
                        Image(systemName: "camera.fill")
                            .resizable()
                            .frame(width: Sp.s12, height: 10)
                            .foregroundColor(.white)
                    }
                    .padding(Sp.s12)
                    .background(Color.main)
                    .clipShape(Circle())
                }
                
                Spacer()
                    .frame(height: Sp.s24)
                
                //MARK: - Board
                VStack(spacing: Sp.s16) {
                    ForEach(accountInfoVM.settingItems) { item in
                        SettingItemView(
                            settingItem: item
                        )
                        .environmentObject(accountInfoVM)
                    }
                }
                
                Spacer()
                
                BaseButton(title: "Đăng xuất") {
                    authenVM.updateAuth(value: false)
                }

            }
            .padding(.horizontal, Sp.s16)
            .padding(.vertical, Sp.s24)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            
            // MARK: - Bottom BAr
//            ZStack {
//                Button {
//
//                } label: {
//                    Text("Chỉnh sửa thông tin")
//                        .font(.system(size: Sp.s14, weight: .medium))
//                }
//                .foregroundColor(Color.blackSystem)
//                .padding(Sp.s16)
//                .frame(maxWidth: .infinity)
//                .overlay(RoundedRectangle(cornerRadius: Sp.s8).stroke(Color.border_2))
//
//            }
//            .padding(Sp.s16)
//            .frame(maxWidth: .infinity)
//            .background(.white)
//            .shadow(color: Color.grey.opacity(0.2), radius: Sp.s8)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color.bg_4)
        .toolbar(.hidden, for: .navigationBar)
        .onAppear() {
            accountInfoVM.getDetailAccount()
        }
    }
}

struct AccountInfoPage_Previews: PreviewProvider {
    static var previews: some View {
        AccountInfoPage()
    }
}
