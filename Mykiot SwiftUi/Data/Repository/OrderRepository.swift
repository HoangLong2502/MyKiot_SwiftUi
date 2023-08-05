//
//  OrderRepository.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 19/07/2023.
//

import Foundation
import Alamofire

enum OrderRouter: URLRequestConvertible {
    case getList
    
    var baseUrl: URL {
        return URL(string: "\(NetWorkManager.shared.baseURL)/order/api/")!
    }
    
    var method: HTTPMethod {
        switch self {
        case .getList: return .get
        }
    }
    
    var path: String {
        switch self {
        case .getList: return "order/"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseUrl.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.method = method
        
        switch self {
        case .getList: request = try JSONEncoding.default.encode(request, with: nil)
        }
        
        return request
    }
}

protocol OrderRepository {
    func getList(complete: ((BaseResponseModel<[OrderResponseModel]>) -> Void)?)
}

class OrderRepositoryImpl: OrderRepository {
    func getList(complete: ((BaseResponseModel<[OrderResponseModel]>) -> Void)?) {
        NetWorkManager.shared.callApi(of: BaseResponseModel<[OrderResponseModel]>.self, router: OrderRouter.getList) { response in
            complete?(response)
        } failure: { err in
            print("-======\(err)")
            complete?(
                BaseResponseModel<[OrderResponseModel]>(
                    statusCode: 400, message: err, data: nil
                )
            )
        }

    }
}
