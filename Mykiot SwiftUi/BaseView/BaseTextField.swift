//
//  BaseTextField.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 13/07/2023.
//

import SwiftUI

struct BaseTextField: View {
    let label: String?
    let hint: String?
    let keyboardType: UIKeyboardType?
    let isPassword: Bool
    let value: Binding<String>
    let backgroundColor: Color?
    let prefixIcon: Image?
    let suffixIcon: Image?
    
    init(label: String?, hint: String? = nil, keyboardType: UIKeyboardType? = nil, isPassword: Bool = false, value: Binding<String>, backgroundColor: Color? = nil, prefixIcon: Image? = nil, suffitIcon: Image? = nil) {
        self.label = label
        self.hint = hint
        self.keyboardType = keyboardType
        self.isPassword = isPassword
        self.value = value
        self.backgroundColor = backgroundColor
        self.suffixIcon = suffitIcon
        self.prefixIcon = prefixIcon
    }
    
    @ViewBuilder
    var body: some View {
        VStack(alignment: .leading) {
            if label != nil {
                Text(label ?? "")
                    .fontWeight(.semibold)
                    .font(Font.custom("Roboto", size: 14))
                Spacer()
                    .frame(height: Sp.s8)
            }
            if isPassword {
                SecureField(hint ?? "Search...", text: value)
                    .frame(height: 48)
                    .padding(.horizontal, Sp.s12)
                    .overlay(
                        RoundedRectangle(cornerRadius: Sp.s8)
                            .strokeBorder(Color.border_2)
                    )
                    .keyboardType(keyboardType ?? .default)
            } else {
                HStack {
                    if let prefixIcon = prefixIcon {
                        prefixIcon
                        
                    }
                    TextField(hint ?? "Search...", text: value)
                        .font(.system(size: Sp.s14, weight: .regular))
                        .frame(height: 48)
                        .keyboardType(keyboardType ?? .default)
                    
                    if let suffixIcon = suffixIcon {
                        suffixIcon
                    }
                }
                .frame(height: 48)
                .padding(.horizontal, Sp.s12)
                .background(backgroundColor ?? .white)
                .cornerRadius(Sp.s8)
                .overlay(
                    RoundedRectangle(cornerRadius: Sp.s8)
                        .strokeBorder(Color.border_2)
                )
            }
        }
    }
}

//struct BaseTextField_Previews: PreviewProvider {
//    @State var text: String = ""
//    static var previews: some View {
//        BaseTextField(label: "label", value: $text)
//    }
//}
