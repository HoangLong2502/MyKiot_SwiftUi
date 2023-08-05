//
//  CardProductView.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 24/07/2023.
//

import SwiftUI

struct CardProductView: View {
    let product: ProductEntity?
    
    init(product: ProductEntity? = nil) {
        self.product = product
    }
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: (product?.image ?? []).isEmpty ? "https://hws.dev/paul.jpg" : product?.image?[0] ?? "https://hws.dev/paul.jpg")) { image in
              image
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: Sp.s8))
            } placeholder: {
              Image(systemName: "photo.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: Sp.s56, maxHeight: Sp.s56)
                .foregroundColor(.purple)
                .opacity(0.5)
            }
            .frame(width: Sp.s56, height: Sp.s56)
            .overlay(
                RoundedRectangle(cornerRadius: Sp.s8)
                    .stroke(Color.border_2, lineWidth: 1)
            )
            .scaledToFill()
            
            Spacer()
                .frame(width: Sp.s16)
            
            VStack(alignment: .leading) {
                Text(product?.title ?? "Sản phẩm")
                    .font(.system(size: Sp.s16, weight: .medium))
                Spacer()
                    .frame(height: Sp.s8)
                HStack {
                    Text(product?.code ?? "SP0001945")
                        .font(.system(size: Sp.s16, weight: .regular))
                        .foregroundColor(Color.grey)
                    
                    Spacer()
                    
                    Text("\(UtilEvents.shared.formatCurrency(product?.priceSell ?? 30000))đ")
                        .font(.system(size: Sp.s16, weight: .regular))
                        .foregroundColor(Color.border_4)
                }
            }
            
            
        }
        .padding(Sp.s16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.white)
        .cornerRadius(Sp.s8)
    }
}

struct CardProductView_Previews: PreviewProvider {
    static var previews: some View {
        CardProductView()
    }
}
