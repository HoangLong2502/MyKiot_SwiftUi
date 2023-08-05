//
//  BaseCheckBox.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 13/07/2023.
//

import SwiftUI
import UIKit

struct BaseCheckBox: View {
    @Binding var toggle: Bool
    var text: String
    var body: some View {
        Button(action: {
            self.toggle.toggle()
        }) {
            Image(self.toggle ? "checkbox-on" :  "checkbox-off")
                .renderingMode(.original)
                .resizable()
                .padding(0)
                .frame(width: 14.0, height: 14.0)
                .background(.white)
            Text(text)
                .font(Font.custom("Roboto", size: 14))
                .kerning(0.28)
                .padding(0)
        }
        .buttonStyle(PlainButtonStyle())
        .background(Color(red: 0, green: 0, blue: 0, opacity: 0.02))
        .cornerRadius(0)
    }
}
