//
//  CustomerRespository.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 31/07/2023.
//

import Foundation
import Alamofire

enum CustomerRouter: URLRequestConvertible {
    
    case getList
    case deleteCustomer(Int)
    case create(Data?, CustomerDataPayloadModel)
    
    var baseUrl: URL {
        return URL(string: "\(NetWorkManager.shared.baseURL)/customer/api/")!
    }
    
    var method: HTTPMethod {
        switch self {
        case .getList: return .get
        case .deleteCustomer: return .delete
        case .create: return .post
        }
    }
    
    var path: String {
        switch self {
        case .deleteCustomer(let id):
            return "customer/\(id)/"
        default: return "customer/"
        }
    }
    
    // MARK: MultipartFormData
    var multipartFormData: MultipartFormData {
        let multipartFormData = MultipartFormData()
        switch self {
        case .create(let avatar, let payload):
            if let imageUser = avatar {
                multipartFormData.append(imageUser, withName: "image", fileName: "file.png", mimeType: "image/png")
            }
            
            let dataJson = try! payload.jsonString() ?? ""
            
            multipartFormData.append(dataJson.data(using: .utf8)!, withName: "data")
        default: ()
        }

        return multipartFormData
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseUrl.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.method = method
        
        switch self {
        default: request = try JSONEncoding.default.encode(request, with: nil)
        }
        
        return request
    }
}

protocol CustomerRepository {
    func getList(page: Int, limit: Int, complete: ((BaseResponseModel<[CustomerResponseModel]>) -> Void)?)
    func deleteCustomer(id: Int, complete: ((BaseResponseModel<String>) -> Void)?)
    func create(avatar: Data?, payload: CustomerDataPayloadModel, complete: ((BaseResponseModel<CustomerResponseModel>) -> Void)?)
}

class CustomerRepositoryImpl: CustomerRepository {
    func getList(page: Int, limit: Int, complete: ((BaseResponseModel<[CustomerResponseModel]>) -> Void)?) {
        NetWorkManager.shared.callApi(of: BaseResponseModel<[CustomerResponseModel]>.self, router: CustomerRouter.getList) { res in
            complete?(res)
        } failure: { err in
            complete?(BaseResponseModel(
                statusCode: 400,
                message: err,
                data: nil
            ))
        }
    }
    
    func deleteCustomer(id: Int, complete: ((BaseResponseModel<String>) -> Void)?) {
        NetWorkManager.shared.callApi(of: BaseResponseModel<String>.self, router: CustomerRouter.deleteCustomer(id)) { res in
            complete?(res)
        } failure: { err in
            complete?(BaseResponseModel(
                statusCode: 400,
                message: err,
                data: nil
            ))
        }
    }
    
    func create(avatar: Data?, payload: CustomerDataPayloadModel, complete: ((BaseResponseModel<CustomerResponseModel>) -> Void)?) {
        let router = CustomerRouter.create(avatar, payload)
        
        NetWorkManager.shared.uploadApi(of: BaseResponseModel<CustomerResponseModel>.self, router: router, multipartForm: router.multipartFormData) { res in
            complete?(res)
        } failure: { err in
            complete?(
                BaseResponseModel(
                    statusCode: 400,
                    message: err
                )
            )
        }

    }
}
