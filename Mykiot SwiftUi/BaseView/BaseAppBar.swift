//
//  BaseAppBar.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 23/07/2023.
//

import SwiftUI

struct BaseAppBar: View {
    let title: String
    let presentationMode: Binding<PresentationMode>
    
    init(title: String, presentationMode: Binding<PresentationMode>) {
        self.title = title
        self.presentationMode = presentationMode
    }
    
    var body: some View {
        HStack {
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "arrow.left")
                    .foregroundColor(Color.blackSystem)
            }
            
            Spacer()
            
            Text(title)
                .font(.system(size: Sp.s16, weight: .medium))
            
            Spacer()
            
            Image(systemName: "bell")
        }
        .padding(Sp.s16)
        .background(.white)
    }
}
//
//struct BaseAppBar_Previews: PreviewProvider {
//    static var previews: some View {
//        BaseAppBar(title: "Test")
//    }
//}
