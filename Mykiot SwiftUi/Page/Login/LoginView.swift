//
//  LoginView.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 17/07/2023.
//

import SwiftUI
import MBProgressHUD

struct LoginView: View {
    @EnvironmentObject var authenVM: AuthenViewModel
    @StateObject private var loginVM = LoginViewModel()
    @State var phone: String = ""
    @State var password: String = ""
    @State var rememberPassword : Bool = false
    
    let loginUsecase: LoginUseCase = LoginUseCase()
    
    var body: some View {
        ZStack {
            VStack() {
                Spacer()
                ZStack {
                    VStack(alignment: .leading) {
                        Text("Đăng nhập")
                            .font(.title)
                            .fontWeight(.bold)
                            .lineLimit(0)
                        Spacer()
                            .frame(height: Sp.s32)
                        Group {
                            BaseTextField(label: "Số điện thoại", hint: "Nhập số điện thoại", keyboardType: .phonePad, value: $phone)
                            Spacer()
                                .frame(height: Sp.s16)
                            BaseTextField(label: "Mật khẩu", hint: "Nhập mật khẩu", isPassword: true, value: $password)
                        }
                        Spacer()
                            .frame(height: Sp.s16)
                        BaseCheckBox(toggle: $rememberPassword, text: "Lưu mật khẩu")
                        Spacer()
                            .frame(height: Sp.s24)
                        
                        HStack {
                            BaseButton(title: "Đăng nhập") {
                                loginVM.login(username: phone, password: password) { res in
                                    authenVM.updateAuth(value: res)
                                }
                            }
                            
                            Spacer()
                                .frame(width: Sp.s16)
                            
                            Image(systemName: loginVM.isUnlocked ? "character" :  "faceid")
                                .padding(Sp.s16)
                                .overlay {
                                    RoundedRectangle(cornerRadius: Sp.s8)
                                        .stroke(Color.border_2)
                                }
                                .gesture(
                                    TapGesture()
                                        .onEnded({ _ in
                                            loginVM.authenticate()
                                        })
                                )
                        }
                        Group {
                            Spacer()
                                .frame(height: Sp.s24)
                            HStack(alignment: .center) {
                                Text("Quên mật khẩu?")
                                    .fontWeight(.medium)
                                    .font(Font.custom("Roboto", size: 14))
                                    .kerning(0.28)
                                    .foregroundColor(Color.blue_1)
                            }
                            .frame(maxWidth: .infinity)
                        }
                    }
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                    .padding(.init(top: Sp.s64, leading: Sp.s24, bottom: Sp.s32, trailing: Sp.s24)
                    )
                    .background(.white)
                    .cornerRadius(Sp.s16)
                }
                .padding(.horizontal, Sp.s16)
                Spacer()
                HStack {
                    Text("Bạn chưa có tài khoản?")
                        .font(Font.custom("Roboto", size: 14))
                        .kerning(0.28)
                    Text("Đăng ký ngay")
                        .font(Font.custom("Roboto", size: 14).weight(.medium))
                        .foregroundColor(Color.blue_1)
                }
            }
            .padding(.bottom, Sp.s24)
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .center
            )
            .background(Color.bg_4)
            .ignoresSafeArea()
            
            if loginVM.showProgressView {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color.main))
                    .scaleEffect(2)
            }
        }.disabled(authenVM.isAuth)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
