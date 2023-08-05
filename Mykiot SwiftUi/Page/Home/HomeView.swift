//
//  HomeView.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 13/07/2023.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var authenVM: AuthenViewModel
    @StateObject var homeVM: HomeViewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                //MARK: Header View
                HomeHeader()
                    .environmentObject(authenVM)
                Spacer()
                    .frame(height: Sp.s24)
                
                //MARK: Bank Card View
                HomeCardBank()
                Spacer()
                    .frame(height: Sp.s24)
                
                //MARK: Function List View
                Text("Danh mục chức năng")
                    .font(Font.custom("Roboto", size: Sp.s18))
                    .fontWeight(.bold)
                Group {
                    Spacer()
                        .frame(height: Sp.s16)
                    HStack(spacing: 16) {
                        // Phần tử 1
                        VStack {
                            Image("home_order_func")
                                .resizable()
                                .frame(width: Sp.s18, height: Sp.s32)
                            Spacer()
                                .frame(height: Sp.s8)
                            Text("Đơn bán hàng")
                                .font(Font.custom("Roboto", size: Sp.s12))
                        }
                        .padding(Sp.s16)
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .cornerRadius(Sp.s8)
                        .shadow(color: Color.border_2, radius: Sp.s4, x: 0, y: Sp.s4)
                        // Phần tử 2
                        NavigationLink(destination: ProductPage()) {
                            VStack {
                                Image("home_order_func")
                                    .resizable()
                                    .frame(width: Sp.s18, height: Sp.s32)
                                Spacer()
                                    .frame(height: Sp.s8)
                                Text("Sản phẩm")
                                    .font(.system(size: Sp.s12, weight: .medium))
                                    .foregroundColor(Color.blackSystem)
                            }
                            .padding(Sp.s16)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .cornerRadius(Sp.s8)
                            .shadow(color: Color.border_2, radius: Sp.s4, x: 0, y: Sp.s4)
                        }
                        // Phần tử 3
                        NavigationLink(destination: CustomerListPage()) {
                            VStack {
                                Image("home_order_func")
                                    .resizable()
                                    .frame(width: Sp.s18, height: Sp.s32)
                                Spacer()
                                    .frame(height: Sp.s8)
                                Text("Khách hàng")
                                    .font(Font.custom("Roboto", size: Sp.s12))
                                    .foregroundColor(Color.blackSystem)
                            }
                            .padding(Sp.s16)
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .cornerRadius(Sp.s8)
                        .shadow(color: Color.border_2, radius: Sp.s4, x: 0, y: Sp.s4)
                        }
                    }
                }
                Spacer()
                    .frame(height: Sp.s24)
                
                //MARK: Order New View
                Text("Đơn hàng Online mới")
                    .font(Font.custom("Roboto", size: Sp.s18))
                    .fontWeight(.bold)
                Spacer()
                    .frame(height: Sp.s16)
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(alignment: .top, spacing: Sp.s16) {
                        ForEach(self.homeVM.listNewOrder, id: \.self) { value in
                            HomeOrderCard(
                                order: value
                            )
                        }
                    }
                }
                .onAppear() {
                    homeVM.getListOrder()
                }
            }
            .ignoresSafeArea()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(.vertical, Sp.s24)
            .padding(.horizontal, Sp.s16)
            .background(Color.bg_4)
        }
//        Text("Logout")
//            .gesture(TapGesture().onEnded({ _ in
//                authenVM.updateAuth(value: false)
//                AuthService.shared.accessToken = ""
//            }))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
