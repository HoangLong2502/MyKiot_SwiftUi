//
//  BasePopup.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 03/08/2023.
//

import SwiftUI
import UIKit

struct BasePopup<Content: View, Popup: View>: View {
    
    @Binding var isShowing: Bool
    var content: () -> Content
    var popup: () -> Popup
    
    var title: String?

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                
                self.content()
//                    .disabled(self.isShowing)
                    .blur(radius: self.isShowing ? 3 : 0)
                    .gesture(
                        TapGesture()
                            .onEnded({ _ in
                                isShowing = false
                            })
                    )
                
//                self.popup()
//                    .opacity(self.isShowing ? 1 : 0)
                
                VStack {
                    self.popup()
                }
                .padding(.vertical, Sp.s16)
                .frame(width: geometry.size.width / 2)
                .background(Color.secondary.colorInvert())
                .foregroundColor(Color.primary)
                .cornerRadius(20)
                .opacity(self.isShowing ? 1 : 0)
                
            }
        }
    }
}
