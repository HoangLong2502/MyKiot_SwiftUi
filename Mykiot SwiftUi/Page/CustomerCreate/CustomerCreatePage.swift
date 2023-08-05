//
//  CustomerCreatePage.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 01/08/2023.
//

import SwiftUI
import _PhotosUI_SwiftUI

struct CustomerCreatePage: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var customerCreateVM: CustomerCreateViewModel = CustomerCreateViewModel()
    @State private var date = Date()
    @State private var showingCredits = false
    @State private var showingAddressPicker = false
    
    var body: some View {
        
        BasePopup(isShowing: $customerCreateVM.showOverlayNoti) {
            return VStack {
                BaseAppBar(title: "Tạo mới khách hàng", presentationMode: presentationMode)
                
                ScrollView {
                    VStack {
                        ZStack(alignment: .bottomTrailing) {
                            if let avatar = customerCreateVM.avatarUI {
                                avatar
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .scaledToFill()
                                    .clipShape(Circle())
                            } else {
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .foregroundColor(Color.grey)
                                    .frame(width: 80, height: 80)
                                    .scaledToFill()
                            }
                            VStack {
                                PhotosPicker(selection: $customerCreateVM.avatar) {
                                    Image(systemName: "camera.fill")
                                        .resizable()
                                        .foregroundColor(Color.white)
                                        .frame(width: Sp.s12, height: Sp.s12)
                                }
                                .onChange(of: customerCreateVM.avatar ?? PhotosPickerItem(itemIdentifier: "")) { newValue in
                                    customerCreateVM.onImageChange(image: newValue)
                                }
                            }
                            .padding(Sp.s8)
                            .background(Color.main)
                            .clipShape(Circle())
                        }
                        
                        Spacer()
                            .frame(height: Sp.s24)
                        
                        VStack {
                            BaseTextField(label: "Tên khách hàng", hint: "Nhập tên khách hàng", value: $customerCreateVM.fullName)
                            Spacer()
                                .frame(height: Sp.s16)
                            BaseTextField(label: "Số điện thoại", hint: "Nhập số điện thoại", keyboardType: .phonePad, value: $customerCreateVM.phone)
                            Spacer()
                                .frame(height: Sp.s16)
                            
                            BaseTextField(label: "Email", hint: "Nhập địa chỉ Email", keyboardType: .emailAddress, value: $customerCreateVM.email)
                            Spacer()
                                .frame(height: Sp.s16)
                            VStack(alignment: .leading) {
                                Text("Giới tính")
                                    .font(.system(size: Sp.s14, weight: .medium))
                                Spacer()
                                    .frame(height: Sp.s8)
                                Picker("Giới tính", selection: $customerCreateVM.gender) {
                                    Text("Chọn giới tính")
                                        .tag(nil as PickerItem?)
                                        .font(.system(size: Sp.s12, weight: .medium))
                                        .foregroundColor(Color.grey)
                                    ForEach(customerCreateVM.listGender, id: \.self) { item in
                                        Text(item.title)
                                            .tag(item as PickerItem?)
                                    }
                                }
                                .accentColor(customerCreateVM.gender == nil ? Color.grey : .black)
                                .padding(Sp.s4)
                                .frame(maxWidth: .infinity)
                                .overlay(RoundedRectangle(cornerRadius: Sp.s8).stroke(Color.border_2))
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Spacer()
                                .frame(height: Sp.s16)
                            
                            VStack(alignment: .leading) {
                                Text("Ngày sinh")
                                    .font(.system(size: Sp.s14, weight: .medium))
                                Spacer()
                                    .frame(height: Sp.s8)
                                
                                Text("\(UtilEvents.shared.formattedDate(date))")
                                .padding(Sp.s12)
                                .frame(maxWidth: .infinity)
                                .overlay(RoundedRectangle(cornerRadius: Sp.s8).stroke(Color.border_2))
                            
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .sheet(isPresented: $showingCredits) {
                                DatePicker(
                                    "Ngày sinh",
                                    selection: $date,
                                    displayedComponents: [.date]
                                )
                                .datePickerStyle(.graphical)
                                .environment(\.locale, Locale.init(identifier: "vi"))
                                .accentColor(.main)
                                .presentationDetents([.fraction(0.6), .medium])
                            }
                            .gesture(
                                TapGesture()
                                    .onEnded({ _ in
                                        showingCredits.toggle()
                                    })
                            )
                            .onChange(of: date) { newValue in
                                let dateString = UtilEvents.shared.formattedDate(newValue, typeFormat: "y-M-dd")
                            }
                        }
                        .padding(Sp.s24)
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .cornerRadius(Sp.s8)
                        
                        Spacer()
                            .frame(height: Sp.s16)
                        
                        AddressPicker { addressEntity in
                            customerCreateVM.lat = addressEntity.lat
                            customerCreateVM.long = addressEntity.long
                            customerCreateVM.province = addressEntity.province
                            customerCreateVM.district = addressEntity.district
                            customerCreateVM.ward = addressEntity.ward
                            customerCreateVM.addressDetail = addressEntity.title
                        }
                        
                    }
                    .padding(.vertical, Sp.s24)
                    .padding(.horizontal, Sp.s16)
                    .frame(maxWidth: .infinity, alignment: .top)
                }
                
                HStack {
                    BaseButton(title: "Tạo mới") {
                        customerCreateVM.createCustomer()
                    }
                }
                .padding(Sp.s16)
                .background(Color.white)
                .frame(maxWidth: .infinity)
                .shadow(radius: Sp.s4)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .background(Color.bg_4)
            .toolbar(.hidden, for: .navigationBar)
        } popup: {
            VStack {
                if customerCreateVM.isLoading {
                    ProgressView()
                    Spacer()
                        .frame(height: Sp.s24)
                }
                Text(customerCreateVM.messageResponse ?? "Đang tạo mới khách hàng, vui lòng đợi!")
                
                if !customerCreateVM.isLoading {
                    Spacer()
                        .frame(height: Sp.s16)
                    Divider()
                    Spacer()
                        .frame(height: Sp.s16)
                    Button("Đóng") {
                        withAnimation {
                            customerCreateVM.showOverlayNoti = false
                        }
                        presentationMode.wrappedValue.dismiss()
                    }
                    .foregroundColor(Color.main)
                }
            }
        }
    }
}

struct CustomerCreatePage_Previews: PreviewProvider {
    static var previews: some View {
        CustomerCreatePage()
    }
}
