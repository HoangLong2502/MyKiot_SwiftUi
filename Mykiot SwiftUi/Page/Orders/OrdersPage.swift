//
//  OrdersPage.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 08/08/2023.
//

import SwiftUI

struct OrdersPage: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedTabIndex = 0
    @StateObject private var orderVM: OrderViewModel = OrderViewModel()
    
    private let tabTitles = ["Tất cả đơn", "Đơn trực tiếp", "Đơn Online"]
    
    var body: some View {
        BaseScaffold(content: {

            VStack {
                Picker("Select Tab", selection: $selectedTabIndex) {
                    ForEach(0..<tabTitles.count, id: \.self) { index in
                        Text(tabTitles[index])
                            .font(.system(
                                size: Sp.s14,
                                weight: index == selectedTabIndex ? .medium : .regular
                            ))
                            .foregroundColor(index == selectedTabIndex ? Color.blackSystem : Color.grey)
                        
                            .tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                TabView(selection: $selectedTabIndex) {
                    OrderTypeView()
                        .environmentObject(orderVM)
                    OrderTypeView()
                        .environmentObject(orderVM)
                    OrderTypeView()
                        .environmentObject(orderVM)
                }
                .tabViewStyle(PageTabViewStyle())
            }
        }, bottomBar: {
            EmptyView()
        }, titleAppBar: "Danh sách đơn bán hàng", presentationMode: presentationMode)
    }
}

struct OrdersPage_Previews: PreviewProvider {
    static var previews: some View {
        OrdersPage()
    }
}
