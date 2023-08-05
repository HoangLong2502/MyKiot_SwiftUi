//
//  AccountRepository.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 04/08/2023.
//

import Foundation
import Alamofire

enum AccountRouter: URLRequestConvertible {
    
    case getDetail
    
    var baseUrl: URL {
        return URL(string: "\(NetWorkManager.shared.baseURL)/account/api/")!
    }
    
    var method: HTTPMethod {
        switch self {
        case .getDetail: return .get
        }
    }
    
    var path: String {
        switch self {
        case .getDetail: return "account/106/"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseUrl.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.method = method
        
        switch self {
        default : request = try JSONEncoding.default.encode(request, with: nil)
        }
        
        return request
    }
}

protocol AccountRepository {
    func getDetail(complete: ((BaseResponseModel<AccountDetailModel>) -> Void)?)
}

class AccountRepositoryImpl: AccountRepository {
    func getDetail(complete: ((BaseResponseModel<AccountDetailModel>) -> Void)?) {
        NetWorkManager.shared.callApi(of: BaseResponseModel<AccountDetailModel>.self, router: AccountRouter.getDetail) { res in
            complete?(res)
        } failure: { err in
            complete?(
                BaseResponseModel(
                    statusCode: 400,
                    message: err,
                    data: nil
                )
            )
        }
    }
    
}
