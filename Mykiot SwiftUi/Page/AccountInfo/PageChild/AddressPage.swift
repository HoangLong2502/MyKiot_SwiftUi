//
//  AddressPage.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 04/08/2023.
//

import SwiftUI
import MapKit

struct AddressPage: View {
    @EnvironmentObject var accountInfoVM: AccountInfoViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Map(coordinateRegion: $accountInfoVM.coordinate, annotationItems: accountInfoVM.markers) { marker in
                MapAnnotation(coordinate: marker.coordinate) {
                    Image(systemName: "mappin")
                        .resizable()
                        .foregroundColor(Color.main)
                        .imageScale(.large)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            VStack {
                Spacer()
                    .frame(height: Sp.s48)
                Image(systemName: "arrow.backward")
                    .padding(Sp.s12)
                    .foregroundColor(Color.blackSystem)
                    .background(Color.white)
                    .clipShape(Circle())
                    .padding(.horizontal, Sp.s16)
                    .shadow(color: Color.grey, radius: Sp.s4)
                    .gesture(
                        TapGesture()
                            .onEnded({ _ in
                                dismiss()
                            })
                    )
            }
            
            VStack(alignment: .leading) {
                Spacer()
                
                VStack(alignment: .leading) {
                    // MARK: - Province
                    HStack {
                        Image(systemName: "circle.fill")
                            .resizable()
                            .frame(width: Sp.s14, height: Sp.s14)
                            .foregroundColor(Color.main)
                        Spacer()
                            .frame(width: Sp.s12)
                        Text(accountInfoVM.accountDetailEntity?.address?.province?.title ?? "Chưa có thông tin")
                            .font(.system(size: Sp.s14, weight: .medium))
                            .foregroundColor(accountInfoVM.accountDetailEntity?.address?.province?.title == nil ? Color.grey : Color.blackSystem)
                    }
                    .padding(Sp.s12)
                    
                    // MARK: - District
                    HStack {
                        Image(systemName: "circle.fill")
                            .resizable()
                            .frame(width: Sp.s14, height: Sp.s14)
                            .foregroundColor(accountInfoVM.accountDetailEntity?.address?.district?.title == nil ? Color.grey : Color.main)
                        Spacer()
                            .frame(width: Sp.s12)
                        Text(accountInfoVM.accountDetailEntity?.address?.district?.title ?? "Chưa có thông tin")
                            .font(.system(size: Sp.s14, weight: .medium))
                            .foregroundColor(accountInfoVM.accountDetailEntity?.address?.district?.title == nil ? Color.grey : Color.blackSystem)
                    }
                    .padding(Sp.s12)
                    
                    // MARK: - Ward
                    HStack {
                        Image(systemName: "circle.fill")
                            .resizable()
                            .frame(width: Sp.s14, height: Sp.s14)
                            .foregroundColor(Color.main)
                        Spacer()
                            .frame(width: Sp.s12)
                        Text(accountInfoVM.accountDetailEntity?.address?.ward?.title ?? "Chưa có thông tin")
                            .font(.system(size: Sp.s14, weight: .medium))
                            .foregroundColor(accountInfoVM.accountDetailEntity?.address?.ward?.title == nil ? Color.grey : Color.blackSystem)
                    }
                    .padding(Sp.s12)
                    
                    Spacer()
                        .frame(height: Sp.s16)
                    
                    Divider()
                    
                    Spacer()
                        .frame(height: Sp.s16)
                    
                    HStack {
                        Image(systemName: "mappin.and.ellipse")
                        Spacer()
                            .frame(width: Sp.s16)
                        Text(accountInfoVM.accountDetailEntity?.address?.title ?? "Chưa có thông tin")
                            .font(.system(size: Sp.s14, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Spacer()
                            .frame(width: Sp.s16)
                        Image(systemName: "gearshape.fill")
                            .padding(Sp.s12)
                            .foregroundColor(.white)
                            .background(Color.main)
                            .clipShape(Circle())
                    }
                    
                }
                .padding(Sp.s16)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .background(Color.white)
                .cornerRadius(Sp.s16)
                .shadow(color: Color.grey.opacity(1), radius: Sp.s4)
                .padding(.horizontal, Sp.s16)
                
                Spacer()
                    .frame(height: Sp.s48)
            }
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .toolbar(.hidden, for: .navigationBar)
    }
}

//struct AddressPage_Previews: PreviewProvider {
//    static var previews: some View {
//        AddressPage()
//    }
//}
