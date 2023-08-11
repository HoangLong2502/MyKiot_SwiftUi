//
//  BankRepository.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 07/08/2023.
//

import Foundation
import Alamofire

enum BankRouter: URLRequestConvertible {
    case listBank
    case checkCard([String: Any])
    case createCard(CreateCardPayloadModel)
    
    var baseUrl: URL {
        return URL(string: "\(NetWorkManager.shared.baseURL)/bank/api/")!
    }
    
    var method: HTTPMethod {
        switch self {
        case .createCard, .checkCard: return .post
        default: return .get
        }
    }
    
    var path: String {
        switch self {
        case .listBank: return "bank/"
        case .checkCard: return "checkcard/"
        case .createCard: return "card/"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseUrl.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.method = method
        
        switch self {
        case .listBank: request = try URLEncoding.queryString.encode(request, with: [
            "page": "1",
            "limit": "100"
        ])
        case .checkCard(let parameters): request = try JSONEncoding.default.encode(request, with: parameters)
        case .createCard(let payload): request = try JSONEncoding.default.encode(request, with: UtilEvents.shared.convertToParameters(payload))
        }
        
        return request
    }
}

protocol BankRepository {
    func listBank(_ complete: ((BaseResponseModel<[BankModel]>) -> Void)?)
    func checkCard(payload: CheckCardPayloadModel, complete: ((BaseResponseModel<String>) -> Void)?)
    func createCard(payload: CreateCardPayloadModel, complete: ((BaseResponseModel<CardDatum>) -> Void)?)
}

struct BankRepositoryImpl: BankRepository {
    func listBank(_ complete: ((BaseResponseModel<[BankModel]>) -> Void)?) {
        NetWorkManager.shared.callApi(of: BaseResponseModel<[BankModel]>.self, router: BankRouter.listBank) { res in
            complete?(res)
        } failure: { err in
            complete?(
                BaseResponseModel(
                    statusCode: 400,
                    message: "\(err)"
                )
            )
        }
    }
    
    func checkCard(payload: CheckCardPayloadModel, complete: ((BaseResponseModel<String>) -> Void)?) {
        let parameters = [
            "bin": payload.bin,
            "accountNumber": payload.accountNumber,
            "transferType": payload.transferType
        ]
        NetWorkManager.shared.callApi(of: BaseResponseModel<String>.self, router: BankRouter.checkCard(parameters as [String : Any])) { res in
            complete?(res)
        } failure: { err in
            complete?(
                BaseResponseModel(
                    statusCode: 400,
                    message: "\(err)"
                )
            )
        }
    }
    
    func createCard(payload: CreateCardPayloadModel, complete: ((BaseResponseModel<CardDatum>) -> Void)?) {
        NetWorkManager.shared.callApi(of: BaseResponseModel<CardDatum>.self, router: BankRouter.createCard(payload)) { res in
            complete?(res)
        } failure: { err in
            complete?(
                BaseResponseModel(
                    statusCode: 400,
                    message: "\(err)"
                )
            )
        }
    }
}
