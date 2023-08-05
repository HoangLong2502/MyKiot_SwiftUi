//
//  Mykiot_SwiftUiApp.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 13/07/2023.
//

import SwiftUI

@main
struct Mykiot_SwiftUiApp: App {
    @StateObject var authenVM = AuthenViewModel()

    var body: some Scene {
        WindowGroup {
            VStack {
                if authenVM.isAuth {
                    HomeView()
                        .environmentObject(authenVM)
                } else {
                    LoginView()
                        .environmentObject(authenVM)
                }
            }.onAppear() {
                authenVM.initData()
            }
        }
    }
}
