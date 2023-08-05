//
//  CustomerDetailPage.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 03/08/2023.
//

import SwiftUI

struct CustomerDetailPage: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            BaseAppBar(title: "Chi tiết khách hàng", presentationMode: presentationMode)
            
            VStack {
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color.bg_4)
        .toolbar(.hidden, for: .navigationBar)
    }
    
}

struct CustomerDetailPage_Previews: PreviewProvider {
    static var previews: some View {
        CustomerDetailPage()
    }
}
