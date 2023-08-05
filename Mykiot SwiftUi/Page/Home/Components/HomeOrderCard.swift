//
//  HomeOrderCard.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 18/07/2023.
//

import SwiftUI

struct HomeOrderCard: View {
    let order: OrderEntity?
    
    init(order: OrderEntity? = nil) {
        self.order = order
    }
    
    var body: some View {
        VStack {
            HStack {
                AsyncImage(url: URL(string: order?.customerAvatar ?? "https://hws.dev/paul.jpg")) { image in
                  image
                    .resizable()
                    .scaledToFit()
                } placeholder: {
                  Image(systemName: "photo.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: Sp.s32, maxHeight: Sp.s32)
                    .foregroundColor(.purple)
                    .opacity(0.5)
                }
                .frame(width: Sp.s32, height: Sp.s32)
                .border(Color.border_2)
                .clipShape(Circle())
                .scaledToFill()
                
                Spacer()
                    .frame(width: Sp.s8)
                
                Text(order?.customerName ?? "Khách lẻ")
                    .font(.system(size: Sp.s14))
                
                Spacer()
                
                Image(systemName: "arrow.right")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
                .frame(height: Sp.s16)
            
            HStack {
                Image(systemName: "calendar.badge.clock")
                    .foregroundColor(Color.grey)
                
                Spacer()
                
                Text("\(UtilEvents.shared.formatDateTime(order?.createdAt ?? ""))")
                    .font(.system(size: Sp.s12, weight: .regular))
                    .frame(alignment: .trailing)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
                .frame(height: Sp.s8)
            
            HStack {
                Image(systemName: "dongsign.square")
                    .foregroundColor(Color.grey)
                
                Spacer()
                
                Text("\(UtilEvents.shared.formatNumber((order?.totalPrice ?? 300000)))đ")
                    .font(.system(size: Sp.s14, weight: .medium))
                    .foregroundColor(Color.main)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
                .frame(height: Sp.s16)
            
            Text("Chờ xác nhận")
                .font(.caption)
                .fontWeight(.medium)
                .frame(maxWidth: .infinity)
                .foregroundColor(Color.border_4)
                .padding(.vertical, Sp.s12)
                .background(Color.border_1)
                .cornerRadius(Sp.s8)
        }
        .padding(Sp.s16)
        .frame(width: 204)
        .background(.white)
        .cornerRadius(Sp.s8)
    }
}

struct HomeOrderCard_Previews: PreviewProvider {
    static var previews: some View {
        HomeOrderCard()
    }
}
