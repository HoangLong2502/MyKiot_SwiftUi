//
//  LocationRepository.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 01/08/2023.
//

import Foundation
import Alamofire

enum LocationRouter: URLRequestConvertible {
    case province
    case district(Int)
    case ward(Int)
    
    var baseUrl: URL {
        return URL(string: "\(NetWorkManager.shared.baseURL)/location/v2/api/")!
    }
    
    var method: HTTPMethod {
        switch self {
        case .province, .ward, .district: return .get
        }
    }
    
    var path: String {
        switch self {
        case .province: return "province/"
        case .district(let id): return "district/\(id)/"
        case .ward(let id): return "ward/\(id)/"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseUrl.appendingPathComponent(path)
        var request = try URLRequest(url: url, method: method)
        
        request = try JSONEncoding.default.encode(request, with: nil)
        
        return request
    }
}

protocol LocationRepository {
    func getProvinces(complete: ((BaseResponseModel<[LocationDataModel]>) -> Void)?)
    func getDistricts(idProvince: Int, complete: ((BaseResponseModel<[LocationDataModel]>) -> Void)?)
    func getWards(idDistrict: Int, complete: ((BaseResponseModel<[LocationDataModel]>) -> Void)?)
}

class LocationRepositoryImpl: LocationRepository {
    func getProvinces(complete: ((BaseResponseModel<[LocationDataModel]>) -> Void)?) {
        NetWorkManager.shared.callApi(of: BaseResponseModel<[LocationDataModel]>.self, router: LocationRouter.province) { res in
            complete?(res)
        } failure: { err in
            complete?(
                BaseResponseModel<[LocationDataModel]>(
                    statusCode: 400,
                    message: err,
                    data: []
                )
            )
        }

    }
    
    func getDistricts(idProvince: Int, complete: ((BaseResponseModel<[LocationDataModel]>) -> Void)?) {
        NetWorkManager.shared.callApi(of: BaseResponseModel<[LocationDataModel]>.self, router: LocationRouter.district(idProvince)) { res in
            complete?(res)
        } failure: { err in
            complete?(
                BaseResponseModel<[LocationDataModel]>(
                    statusCode: 400,
                    message: err,
                    data: []
                )
            )
        }
    }
    
    func getWards(idDistrict: Int, complete: ((BaseResponseModel<[LocationDataModel]>) -> Void)?) {
        NetWorkManager.shared.callApi(of: BaseResponseModel<[LocationDataModel]>.self, router: LocationRouter.ward(idDistrict)) { res in
            complete?(res)
        } failure: { err in
            complete?(
                BaseResponseModel<[LocationDataModel]>(
                    statusCode: 400,
                    message: err,
                    data: []
                )
            )
        }
    }
    
    
}
