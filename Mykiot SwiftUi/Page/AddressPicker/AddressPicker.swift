//
//  AddressPicker.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 01/08/2023.
//

import SwiftUI
import MapKit

struct AddressPicker: View {
    @State private var showingAddressPicker = false
    @StateObject private var addressPickerVM = AddressPickerViewModel()
    @State var xOffset: Double = 0
    
    let onComplete: ((_ address: AddressEntity) -> Void)?
    
    init(onComplete: ((_: AddressEntity) -> Void)? = nil) {
        self.onComplete = onComplete
    }
    
    var body: some View {
        ZStack {
            
            // MARK: - Show Map and Address affter select All Location
            if let lat = addressPickerVM.lat, let lng = addressPickerVM.lng {
                VStack {
                    Map(coordinateRegion: $addressPickerVM.region, annotationItems: addressPickerVM.markers) { marker in
                        MapAnnotation(coordinate: marker.coordinate) {
                            Image(systemName: "mappin")
                                .resizable()
                                .foregroundColor(Color.blue_1)
                                .imageScale(.large)
                        }
                    }
                    .frame(height: 200)
                    
                    Spacer()
                        .frame(height: Sp.s16)
                    HStack {
                        Image(systemName: "mappin.circle.fill")
                        Spacer()
                            .frame(width: Sp.s12)
                        Text("Vị trí hiện tại")
                            .font(.system(size: Sp.s14))
                            .foregroundColor(Color.grey)
                        Spacer()
                        Text("Sửa vị trí")
                            .lineLimit(0)
                            .font(.system(size: Sp.s14, weight: .medium))
                            .foregroundColor(Color.blue_1)
                            .gesture(
                                TapGesture()
                                    .onEnded({ _ in
                                        showingAddressPicker = true
                                    })
                            )
                    }
                    Spacer()
                        .frame(height: Sp.s16)
                    Text("\(addressPickerVM.searchKey), \(addressPickerVM.wardSelected?.title ?? ""), \(addressPickerVM.districtSelected?.title ?? ""), \(addressPickerVM.provinceSelected?.title ?? "")")
                        .font(.system(size: Sp.s14, weight: .medium))
                }
                .padding(Sp.s24)
                .frame(maxWidth: .infinity)
                .background(.white)
                .cornerRadius(Sp.s8)
                .shadow(color: Color.grey.opacity(0.2), radius: Sp.s4)
            } else {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Thêm địa chỉ để xác định địa điểm \n bán hàng và vận chuyển")
                            .font(.system(size: Sp.s12, weight: .medium))
                            .foregroundColor(Color.grey)
                        Spacer()
                            .frame(height: Sp.s8)
                        Text("Thêm địa chỉ")
                            .font(.system(size: Sp.s14, weight: .medium))
                            .foregroundColor(Color.blue_1)
                            .gesture(
                                TapGesture()
                                    .onEnded({ _ in
                                        showingAddressPicker = true
                                    })
                            )
                    }
                    
                    Spacer()
                    
                    Image("map_icon")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .scaledToFit()
                }
                .padding(Sp.s24)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.white)
                .cornerRadius(Sp.s8)
                .shadow(color: Color.grey.opacity(0.2), radius: Sp.s4)
            }
        }
        .sheet(isPresented: $showingAddressPicker) {
            VStack(alignment: .leading) {
                HStack {
                    Text("Đóng")
                        .font(.system(size: Sp.s14, weight: .medium))
                        .foregroundColor(Color.blue_1)
                        .gesture(
                            TapGesture()
                                .onEnded({ _ in
                                    showingAddressPicker = false
                                })
                        )
                    
                    Spacer()
                    
                    Text("Hoàn thành")
                        .font(.system(size: Sp.s14, weight: .medium))
                        .foregroundColor(addressPickerVM.wardSelected == nil ? Color.grey : Color.blue_1)
                        .gesture(
                            TapGesture()
                                .onEnded({ _ in
                                    if addressPickerVM.wardSelected != nil {
                                        addressPickerVM.complete { addressEntity in
                                            onComplete?(addressEntity)
                                        }
                                        showingAddressPicker = false
                                    }
                                })
                        )
                }
                .padding(Sp.s16)
                .background(Color.bg_4)
                
                Spacer()
                    .frame(height: Sp.s24)
                
                VStack {
                    Text("Chọn khu vực")
                        .font(.system(size: Sp.s16, weight: .medium))
                }
                .padding(.horizontal, Sp.s16)
                
                Spacer()
                    .frame(height: Sp.s24)
                
                // MARK: - Step view select area
                ZStack(alignment: .topLeading) {
                    
                    ZStack(alignment: .topLeading) {
                        VStack {
                            Path{ path in
                                path.move(to: CGPoint(x: 0, y: Sp.s16))
                                path.addLine(to: CGPoint(x: 0, y: 120))
                            }
                            .stroke(style: StrokeStyle( lineWidth: 1, dash: [5]))
                            .foregroundColor(Color.border_3)
                        }
                        .offset(x: 35, y: 0)
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Image(systemName: "circle.fill")
                                    .resizable()
                                    .frame(width: Sp.s14, height: Sp.s14)
                                    .foregroundColor(addressPickerVM.provinceSelected != nil ? Color.main : Color.grey)
                                Spacer()
                                    .frame(width: Sp.s12)
                                Text(addressPickerVM.provinceSelected?.title ?? "Tỉnh / Thành phố")
                                    .font(.system(size: Sp.s14, weight: .medium))
                                    .foregroundColor(addressPickerVM.provinceSelected != nil ? Color.blackSystem : Color.grey)
                            }
                            .padding(Sp.s12)
                            .gesture(
                                TapGesture()
                                    .onEnded({ _ in
                                        addressPickerVM.stepPicker = .province
                                    })
                            )
                            
                            HStack {
                                Image(systemName: "circle.fill")
                                    .resizable()
                                    .frame(width: Sp.s14, height: Sp.s14)
                                    .foregroundColor(addressPickerVM.districtSelected != nil ? Color.main : Color.grey)
                                Spacer()
                                    .frame(width: Sp.s12)
                                Text(addressPickerVM.districtSelected?.title ?? "Quận / Huyện")
                                    .font(.system(size: Sp.s14, weight: .medium))
                                    .foregroundColor(addressPickerVM.districtSelected != nil ? Color.blackSystem : Color.grey)
                            }
                            .padding(Sp.s12)
                            .gesture(
                                TapGesture()
                                    .onEnded({ _ in
                                        if addressPickerVM.provinceSelected != nil {
                                            addressPickerVM.stepPicker = .district
                                        }
                                    })
                            )
                            
                            HStack {
                                Image(systemName: "circle.fill")
                                    .resizable()
                                    .frame(width: Sp.s14, height: Sp.s14)
                                    .foregroundColor(addressPickerVM.wardSelected != nil ? Color.main : Color.grey)
                                Spacer()
                                    .frame(width: Sp.s12)
                                Text(addressPickerVM.wardSelected?.title ?? "Phường / Xã")
                                    .font(.system(size: Sp.s14, weight: .medium))
                                    .foregroundColor(addressPickerVM.wardSelected != nil ? Color.blackSystem : Color.grey)
                            }
                            .padding(Sp.s12)
                            .gesture(
                                TapGesture()
                                    .onEnded({ _ in
                                        if addressPickerVM.districtSelected != nil {
                                            addressPickerVM.stepPicker = .ward
                                        }
                                    })
                            )
                        }
                        .padding(.horizontal, Sp.s16)
                    }
                    .frame(maxHeight: 150)
                    .zIndex(0)
                    
                    BaseTextField(label: nil, hint: "Chọn \(addressPickerVM.stepPicker.title)", value: $addressPickerVM.searchKey, prefixIcon: Image("location_search_prefix"))
                        .padding(.horizontal, Sp.s16)
                        .offset(y: xOffset)
                        .zIndex(1)
                }
                
                Spacer()
                    .frame(height: addressPickerVM.stepPicker == .detail ? Sp.s64 : Sp.s24)
                
                Divider()
                
                Spacer()
                    .frame(height: Sp.s24)
                
                
                Text("Danh sách \(addressPickerVM.stepPicker.title)")
                    .padding(.horizontal, Sp.s16)
                
                VStack {
                    ScrollView {
                        LazyVStack {
                            ForEach(addressPickerVM.dataLocation.filter({ item in
                                guard let title = item.title else {
                                    return true
                                }
                                
                                if addressPickerVM.searchKey.isEmpty {
                                    return true
                                }
                                
                                return title.lowercased().contains(addressPickerVM.searchKey.lowercased())
                            }), id: \.self) { item in
                                VStack {
                                    Spacer()
                                        .frame(height: Sp.s16)
                                    Text(item.title ?? "")
                                        .font(.system(size: Sp.s16, weight: .regular))
                                    Spacer()
                                        .frame(height: Sp.s16)
                                    Divider()
                                }
                                .gesture(
                                    TapGesture()
                                        .onEnded({ _ in
                                            addressPickerVM.selectLocation(item)
                                        })
                                )
                            }
                        }
                    }
                }
                .padding(.horizontal, Sp.s16)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
            }
            .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height * 0.8, alignment: .topLeading)
            .presentationDetents([.height(UIScreen.main.bounds.height * 0.8)])
        }
        .onAppear() {
            addressPickerVM.getListProvince()
        }
        .onChange(of: addressPickerVM.stepPicker) { newValue in
            addressPickerVM.stepPickerChange()
            withAnimation(.easeInOut(duration: 0.3)) {
                switch newValue {
                case .province:
                    xOffset = 0
                    addressPickerVM.getListProvince()
                case .district:
                    xOffset = 50
                    addressPickerVM.getListDistrict()
                case .ward:
                    xOffset = 100
                    addressPickerVM.getListWard()
                case .detail:
                    xOffset = 150
                }
            }
        }
    }
}

struct AddressPicker_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            AddressPicker()
        }
    }
}
