//
//  InfoItemView.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 04/08/2023.
//

import SwiftUI

struct InfoItemView: View {
    let title: String
    let content: String?
    let iconSystem: String
    
    var body: some View {
        HStack() {
            Image(systemName: iconSystem)
                .resizable()
                .frame(width: Sp.s16, height: Sp.s16)
                .foregroundColor(Color.main)
                .scaledToFit()
            Spacer()
                .frame(width: Sp.s12)
            Text(title)
            Spacer()
            Text(content ?? "-")
                .fontWeight(.medium)
                .foregroundColor(Color.grey)
        }
        .padding(Sp.s16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.white)
        .cornerRadius(Sp.s16)
        .overlay {
            RoundedRectangle(cornerRadius: Sp.s16).strokeBorder(Color.border_2)
        }
    }
}
