//
//  CustomerPreviewCard.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 31/07/2023.
//

import SwiftUI

struct CustomerPreviewCard: View {
    @EnvironmentObject var customerListVM: CustomerListViewModel
    
    let customer: CustomerEntity?
    
    init(customer: CustomerEntity?) {
        self.customer = customer
    }
    
    @State var isSwiper: Bool = false
    @State var offsetWidth: Double = 0
    
    var body: some View {
        ZStack {
            VStack {
                Image(systemName: "trash.fill")
                    .foregroundColor(Color.white)
            }
            .padding(.horizontal, Sp.s48)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
            .background(Color.red_1)
            .cornerRadius(Sp.s16)
            .padding(.horizontal, Sp.s16)
            .gesture(
                TapGesture()
                    .onEnded({ _ in
                        guard let id = customer?.id else {
                            return
                        }
                        customerListVM.deleteCustomer(id)
                        withAnimation {
                            offsetWidth = -1000
                        }
                    })
            )
            HStack {
                if let avatar = customer?.image {
                    AsyncImage(url: URL(string: avatar)) { image in
                        image
                            .resizable()

                    } placeholder: {
                        Image(systemName: "photo.circle.fill")
                          .resizable()
                          .scaledToFit()
                          .frame(maxWidth: Sp.s32, maxHeight: Sp.s32)
                          .foregroundColor(.purple)
                          .opacity(0.5)
                    }
                    .frame(width: Sp.s56, height: Sp.s56)
                    .clipShape(Circle())
                    .scaledToFit()
                } else {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .foregroundColor(Color.grey)
                        .frame(width: Sp.s56, height: Sp.s56)
                        .clipShape(Circle())
                        .scaledToFill()
                }
                
                Spacer()
                    .frame(width: Sp.s12)
                
                VStack(alignment: .leading) {
                    Text(customer?.fullName ?? "")
                        .font(.system(size: Sp.s16, weight: .medium))
                        .foregroundColor(Color.blackSystem)
                    Spacer()
                        .frame(height: Sp.s12)
                    HStack {
                        Image(systemName: "phone.circle.fill")
                            .foregroundColor(Color.grey)
                        Spacer()
                            .frame(width: Sp.s8)
                        Text(customer?.phone ?? "")
                            .font(.system(size: Sp.s16, weight: .regular))
                            .foregroundColor(Color.grey)
                    }
                }
            }
            .padding(Sp.s16)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.white)
            .cornerRadius(Sp.s16)
            .shadow(color: Color.grey.opacity(0.3), radius: Sp.s8)
            .padding(.horizontal, Sp.s16)
            .offset(CGSize(width: offsetWidth, height: 0))
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        customerListVM.idCardCustomerFocus = customer?.id
                        let startY = gesture.startLocation.x
                        let locationY = gesture.location.x
                        let equal = startY - locationY
                        withAnimation {
                            if -100 <= offsetWidth && offsetWidth <= 0 {
                                if equal > 0 && offsetWidth != -100 {
                                    offsetWidth = 0 - equal
                                } else if equal < 0 && offsetWidth != 0 {
                                    offsetWidth = -100 - equal
                                }
                            }
                        }
                    }
                    .onEnded { gesture in
                        let startY = gesture.startLocation.x
                        let locationY = gesture.location.x
                        withAnimation(.easeInOut) {
                            if startY > locationY {
                                offsetWidth = -100
                            } else {
                                offsetWidth = 0
                            }
                        }
                    }
            )
            .onChange(of: customerListVM.idCardCustomerFocus) { newValue in
                if newValue != customer?.id {
                    withAnimation(.easeInOut) {
                        offsetWidth = 0
                    }
                }
            }
        }
    }
}
