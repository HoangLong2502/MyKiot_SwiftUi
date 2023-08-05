//
//  BaseButton.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 13/07/2023.
//

import SwiftUI

struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.blue)
            .foregroundStyle(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct BaseButton: View {
    let title: String
    let onTap: (() -> Void)?
    
    init(title: String, onTap: (() -> Void)? = nil) {
        self.title = title
        self.onTap = onTap
    }
    
    var body: some View {
        VStack {
            Text(title)
                .fontWeight(.semibold)
                .font(.system(size: Sp.s14, weight: .medium))
                .foregroundColor(Color.white)
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity)
        .padding(.init(top: Sp.s16, leading: Sp.s16, bottom: Sp.s16, trailing: Sp.s16))
        .background(Color.main)
        .cornerRadius(Sp.s8)
        .gesture(TapGesture().onEnded({ _ in
            onTap?()
        }))
    }
}
