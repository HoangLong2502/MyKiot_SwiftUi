//
//  OrderUseCase.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 19/07/2023.
//

import Foundation

class OrderUseCase: BaseUseCase {
    typealias I = OrderInput
    
    typealias O = OrderOutput
    
    let orderRepository: OrderRepository = OrderRepositoryImpl()
    let orderMapper: OrderEntityMapper = OrderEntityMapper()
    
    func buildUseCase(input: OrderInput, complete: ((OrderOutput) -> Void)?) {
        orderRepository.getList { response in
            let listOrderEntity = self.orderMapper.mapToListEntity(listData: response.data)
            
            let output = OrderOutput(response: BaseResponseModel(
                statusCode: response.statusCode,
                message: response.message,
                data: listOrderEntity
            ))
            complete?(output)
        }
    }
}

class OrderInput: BaseInput {
    
}

class OrderOutput: BaseOutput {
    let response: BaseResponseModel<[OrderEntity]>
    init(response: BaseResponseModel<[OrderEntity]>) {
        self.response = response
    }
}
