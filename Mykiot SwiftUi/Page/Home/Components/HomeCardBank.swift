//
//  HomeCardBank.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 18/07/2023.
//

import SwiftUI

struct HomeCardBank: View {
    var body: some View {
        ZStack {
            Image("map")
                .resizable()
            
            VStack(alignment: .leading) {
                Image("tech")
                    .resizable()
                    .frame(width: 73, height: Sp.s32)
                    .padding(Sp.s8)
                    .background(Color.border_2)
                    .cornerRadius(Sp.s16)
                
                Spacer()
                    .frame(height: Sp.s24)
                
                Text("0000 6789 1234 4567")
                    .font(Font.custom("Roboto", size: Sp.s24))
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                
                Spacer()
                    .frame(height: Sp.s24)
                
                Grid(alignment: .center, horizontalSpacing: Sp.s16) {
                    GridRow {
                        VStack {
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                            Spacer()
                                .frame(height: Sp.s8)
                            Text("Thêm thẻ")
                                .font(Font.custom("Roboto", size: Sp.s12))
                                .foregroundColor(.white)
                        }
                        .frame(width: 100)
                        VStack {
                            Image(systemName: "rectangle.portrait.and.arrow.forward")
                                .foregroundColor(.white)
                            Spacer()
                                .frame(height: Sp.s8)
                            Text("Xem tất cả")
                                .font(Font.custom("Roboto", size: Sp.s12))
                                .foregroundColor(.white)
                        }
                        .frame(width: 100)
                        VStack {
                            Image(systemName: "note.text")
                                .foregroundColor(.white)
                            Spacer()
                                .frame(height: Sp.s8)
                            Text("Hoá đơn")
                                .font(Font.custom("Roboto", size: Sp.s12))
                                .foregroundColor(.white)
                        }
                        .frame(width: 100)
                    }
                }
                .frame(maxWidth: .infinity)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
        .padding(Sp.s16)
        .frame(maxWidth: .infinity, maxHeight: 200, alignment: .topLeading)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.main, Color.accent_1]), startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .cornerRadius(Sp.s16)
        .shadow(color: Color.border_2, radius: Sp.s4, x: 0, y: Sp.s4)

    }
}

//struct HomeCardBank_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeCardBank()
//    }
//}
