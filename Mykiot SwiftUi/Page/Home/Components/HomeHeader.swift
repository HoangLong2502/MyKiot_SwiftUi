//
//  HomeHeader.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 18/07/2023.
//

import SwiftUI

struct HomeHeader: View {
    var body: some View {
        HStack(alignment: .center) {
            HStack {
                NavigationLink(destination: AccountInfoPage()) {
                    ZStack {
                        Circle()
                            .stroke(Color.border_2, lineWidth: 1)
                            .frame(width: 46, height: 46)
                        
                        Image("shop")
                            .resizable()
                            .frame(width: Sp.s20, height: Sp.s20)
                    }
                }
                
                Spacer()
                    .frame(width: Sp.s16)
                
                VStack(alignment: .leading) {
                    Text("Xin chào")
                        .font(Font.custom("Roboto", size: Sp.s16))
                        .fontWeight(.regular)
                    Spacer()
                        .frame(height: Sp.s4)
                    Text("Cửa hàng tạp hoá số 1")
                        .font(Font.custom("Roboto", size: Sp.s16))
                        .fontWeight(.medium)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            ZStack {
                Circle()
                    .fill(Color.accent_1)
                    .frame(width: 46, height: 46)
                
                Image("bell")
                    .resizable()
                    .frame(width: Sp.s16, height: Sp.s20)
                
            }
        }
        .frame(maxWidth: .infinity)
    }
}

//struct HomeHeader_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeHeader()
//    }
//}
