//
//  BaseScaffold.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 04/08/2023.
//

import SwiftUI

struct BaseScaffold<Content: View, BottomBar: View>: View {
    
    var content: () -> Content
    var bottomBar: () -> BottomBar
    var titleAppBar: String
    var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            BaseAppBar(title: titleAppBar, presentationMode: presentationMode)
            
            ZStack {
                content()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            
            bottomBar()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color.bg_4)
        .toolbar(.hidden, for: .navigationBar)
    }
}
