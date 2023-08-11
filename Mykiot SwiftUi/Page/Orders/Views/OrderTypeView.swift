//
//  OrderTypeView.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 08/08/2023.
//

import SwiftUI

struct OrderTypeView: View {
    @EnvironmentObject var orderVM: OrderViewModel
    
    var body: some View {
        VStack {
            BaseButton(title: "Tạo mới đơn bán hàng") {
                
            }
            
            Spacer()
                .frame(height: Sp.s24)
            
            BaseTextField(
                label: nil,
                hint: "Tìm kiếm",
                value: $orderVM.keySearch
            )
        }
        .padding(Sp.s16)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color.bg_4)
    }
}

struct OrderTypeView_Previews: PreviewProvider {
    static var previews: some View {
        OrderTypeView()
    }
}
