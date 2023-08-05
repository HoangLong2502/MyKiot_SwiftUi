//
//  CustomerListPage.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 31/07/2023.
//

import SwiftUI

struct CustomerListPage: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var customerListVM = CustomerListViewModel()
    
    @State private var toCreatePage: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                BaseAppBar(title: "Khách hàng", presentationMode: presentationMode)
                
                Spacer()
                    .frame(height: Sp.s24)
                
                NavigationLink(destination: CustomerCreatePage()) {
                    HStack {
                        Text("Tạo khách hàng")
                            .font(.system(size: Sp.s14, weight: .medium))
                            .foregroundColor(.white)
                    }
                    .padding(Sp.s16)
                    .frame(maxWidth: .infinity)
                    .background(Color.main)
                    .cornerRadius(Sp.s8)
                }
                
                .padding(.horizontal, Sp.s16)
                
                Spacer()
                    .frame(height: Sp.s24)
                
                BaseTextField(label: nil, hint: "Tìm kiếm", value: $customerListVM.searchKey)
                    .padding(.horizontal, Sp.s16)
                
                Spacer()
                    .frame(height: Sp.s24)
                
                LazyVStack(spacing: Sp.s16) {
                    ForEach(customerListVM.listCustomer, id: \.self) { item in
                        NavigationLink(destination: CustomerDetailPage()) {
                            CustomerPreviewCard(
                                customer: item
                            )
                            .environmentObject(customerListVM)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .background(Color.bg_4)
            .onAppear() {
                customerListVM.getList(page: 1, limit: 10, search: "")
            }
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

struct CustomerListPage_Previews: PreviewProvider {
    static var previews: some View {
        CustomerListPage()
    }
}
