//
//  SettingItemView.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 04/08/2023.
//

import SwiftUI

struct SettingItemView: View {
    let settingItem: SettingItemEntity
    @State private var isVisible = false
    @State private var offsetX: Double = -250
    @State private var opacity: Double = 0.5
    @EnvironmentObject var accountInfoVM: AccountInfoViewModel
    var body: some View {
        
        NavigationLink(destination: settingItem.destination.environmentObject(accountInfoVM)) {
            HStack {
                ZStack {
                    Image(systemName: settingItem.iconSystem)
                        .foregroundColor(settingItem.color)
                }
                .frame(width: Sp.s48, height: Sp.s48)
                .background(settingItem.bgColor)
                .clipShape(Circle())
                
                Spacer()
                    .frame(width: Sp.s16)
                
                Text(settingItem.title)
                    .font(.system(size: Sp.s14, weight: .medium))
                    .foregroundColor(Color.blackSystem)
                
                Spacer()
                
                Image(systemName: "chevron.compact.right")
            }
            .padding(Sp.s16)
            .frame(maxWidth: .infinity)
            .background(.white)
            .cornerRadius(Sp.s16)
            .offset(x: offsetX)
            .opacity(opacity)
            .onAppear {
                if !isVisible {
                    isVisible = true
                    withAnimation(.easeInOut(duration: 0.5).delay(settingItem.delayAnimation)) {
                        offsetX = 30
                        opacity = 1
                    }
                    withAnimation(.easeInOut(duration: 0.2).delay(settingItem.delayAnimation + 0.5)) {
                        offsetX = -10
                    }
                    withAnimation(.easeInOut(duration: 0.2).delay(settingItem.delayAnimation + 0.5 + 0.2)) {
                        offsetX = 0
                    }
                }
            }
        }
    }
}

//struct SettingItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingItemView()
//    }
//}
