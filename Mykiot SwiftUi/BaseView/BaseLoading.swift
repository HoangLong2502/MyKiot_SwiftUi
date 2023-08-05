//
//  BaseLoading.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 30/07/2023.
//

import SwiftUI
import UIKit

struct BaseLoading<Content>: View where Content: View {
    @Binding var isShowing: Bool
    var content: () -> Content
    var title: String?

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                
                self.content()
                    .disabled(self.isShowing)
                    .blur(radius: self.isShowing ? 3 : 0)
                
                VStack {
                    Text(title ?? "Loading...")
                    
                    ProgressView()
                }
                .frame(width: geometry.size.width / 2,
                       height: geometry.size.height / 5)
                .background(Color.secondary.colorInvert())
                .foregroundColor(Color.primary)
                .cornerRadius(20)
                .opacity(self.isShowing ? 1 : 0)
                
            }
        }
    }
}
