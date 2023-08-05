//
//  InfoPage.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 04/08/2023.
//

import SwiftUI

struct InfoPage: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject private var accountInfoVM: AccountInfoViewModel
    
    var body: some View {
        BaseScaffold(content: {
            VStack {
                ZStack(alignment: .top) {
                    //MARK: - Info white
                    VStack {
                        Text(accountInfoVM.accountDetailEntity?.storeName ?? "Chưa có thông tin")
                            .font(.system(size: Sp.s24, weight: .bold))
                        Spacer()
                            .frame(height: Sp.s12)
                        Text(accountInfoVM.accountDetailEntity?.code ?? "Chưa có thông tin")
                            .font(.system(size: Sp.s14, weight: .medium))
                            .foregroundColor(Color.grey)
                        Spacer()
                            .frame(height: Sp.s24)
                        
                        Group {
                            InfoItemView(title: "Người đại diện", content: accountInfoVM.accountDetailEntity?.fullName ?? "Chưa có thông tin", iconSystem: "person.fill")
                            Spacer()
                                .frame(height: Sp.s16)
                            InfoItemView(title: "Tên cửa hàng", content: accountInfoVM.accountDetailEntity?.storeName ?? "Chưa có thông tin", iconSystem: "cart.fill")
                            Spacer()
                                .frame(height: Sp.s16)
                            InfoItemView(title: "Số điện thoại", content: accountInfoVM.accountDetailEntity?.phone ?? "Chưa có thông tin", iconSystem: "phone.circle.fill")
                            Spacer()
                                .frame(height: Sp.s16)
                            InfoItemView(title: "Website", content: accountInfoVM.accountDetailEntity?.webSite ?? "Chưa có thông tin", iconSystem: "filemenu.and.cursorarrow")
                            Spacer()
                                .frame(height: Sp.s16)
                            InfoItemView(title: "Email", content: accountInfoVM.accountDetailEntity?.email ?? "Chưa có thông tin", iconSystem: "mail.fill")
                        }
                        
                    }
                    .padding(.vertical, Sp.s64)
                    .padding(.horizontal, Sp.s16)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    .background(Color.bg_4)
                    .clipShape(RoundedRectangle(cornerRadius: Sp.s16))
                    .offset(y: 150)
                    
                    //MARK: - Avatar
                    ZStack(alignment: .bottomTrailing) {
                        AsyncImage(url: URL(string: accountInfoVM.accountDetailEntity?.avatar ?? "https://thongtinkpop.com/wp-content/uploads/2021/05/han-so-hee-profile.jpg")) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .stroke(Color.white, lineWidth: 4)
                                )
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
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: 4)
                        )
                    }
                    .offset(y: 100)
                }
            }
            .padding(.vertical, Sp.s24)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background() {
                //MARK: - Background Image
                AsyncImage(url: URL(string: accountInfoVM.accountDetailEntity?.avatar ?? "https://thongtinkpop.com/wp-content/uploads/2021/05/han-so-hee-profile.jpg")) { image in
                    image
                        .resizable()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .scaledToFill()                        .blur(radius: Sp.s8)
                } placeholder: {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .foregroundColor(Color.grey)
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            
        }, bottomBar: {
            EmptyView()
        }, titleAppBar: "Thông tin cửa hàng", presentationMode: presentationMode)
    }
}

struct InfoPage_Previews: PreviewProvider {
    static var previews: some View {
        InfoPage()
    }
}
