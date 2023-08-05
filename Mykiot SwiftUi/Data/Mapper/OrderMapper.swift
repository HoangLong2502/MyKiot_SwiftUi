//
//  OrderMapper.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 19/07/2023.
//

import Foundation

class OrderEntityMapper: BaseDataMapper {
    
    typealias I = OrderResponseModel
    
    typealias M = OrderEntity
    
    func mapToEntity(data: OrderResponseModel?) -> OrderEntity {
        return OrderEntity(
            id: data?.id,
            title: data?.title,
            code: data?.code,
            totalPrice: data?.total,
            createdAt: data?.createdAt,
            customerAvatar: data?.customerData?.image,
            customerName: data?.customerData?.fullName,
            orderStatus: OrderStatusEntity(
                id: data?.statusOrderData?.id,
                title: data?.statusOrderData?.title,
                code: data?.statusOrderData?.code
            )
        )
    }
}
