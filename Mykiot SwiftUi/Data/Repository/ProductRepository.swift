//
//  ProductRepository.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 24/07/2023.
//

import Foundation
import Alamofire
import SwiftUI

enum ProductRouter: URLRequestConvertible {
    case getList
    case create(imageData: [Data], otherParameters: [String: String])
    
    var baseUrl: URL {
        return URL(string: "\(NetWorkManager.shared.baseURL)/product/api/")!
    }
    
    var method: HTTPMethod {
        switch self {
        case .getList: return .get
        case .create: return .post
        }
    }
    
    var path: String {
        switch self {
        case .getList, .create: return "product/"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseUrl.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.method = method
        
        switch self {
        case .getList: request = try JSONEncoding.default.encode(request, with: nil)
        case .create(_, let parameters): request = try URLEncodedFormParameterEncoder.default.encode(parameters, into: request)
        }
        
        return request
    }
}

protocol ProductRepository {
    func getList(complete: ((BaseResponseModel<[ProductResponseModel]>) -> Void)?)
    func create(imageData: [Data], payload: [String: String], complete: ((BaseResponseModel<ProductResponseModel>) -> Void)?)
}

class ProductRepositoryImpl: ProductRepository {
    func create(imageData: [Data], payload: [String: String], complete: ((BaseResponseModel<ProductResponseModel>) -> Void)?) {
        AF.upload(multipartFormData: { multipartFormData in
            for (key, value) in payload {
                multipartFormData.append(value.data(using: .utf8)!, withName: key)
            }
            for item in imageData {
                multipartFormData.append(item, withName: "media_product", fileName: "image.jpg", mimeType: "image/jpeg")
            }
        }, to: URL(string: "\(NetWorkManager.shared.baseURL)/product/api/product/")!, method: .post, headers: [
            "Authorization": "Token \(AuthService.shared.accessToken)",
            "Content-Type": "application/json"
            // Thêm các tiêu đề HTTP khác nếu cần thiết
        ]).cURLDescription { des in
            print("=======\(des)=======")
        } .responseDecodable(of: BaseResponseModel<ProductResponseModel>.self) { response in
            switch response.result {
            case .success(let product):
                print("=======Ngon=======")
                complete?(BaseResponseModel(
                    statusCode: product.statusCode,
                    message: product.message,
                    data: product.data
                ))
            case .failure(let err):
                print("=======\(err)========")
            }
        }
    }
    
    func getList(complete: ((BaseResponseModel<[ProductResponseModel]>) -> Void)?) {
        NetWorkManager.shared.callApi(of: BaseResponseModel<[ProductResponseModel]>.self, router: ProductRouter.getList) { response in
            complete?(response)
        } failure: { err in
            print("-======\(err)")
            complete?(
                BaseResponseModel<[ProductResponseModel]>(
                    statusCode: 400, message: err, data: nil
                )
            )
        }

    }
}
