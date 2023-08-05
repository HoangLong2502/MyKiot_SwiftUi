import Foundation
import Alamofire

enum AuthRouter: URLRequestConvertible {
    case login(LoginPayloadModel)
    case refreshToken(refreshToken: String)
    case register([String: String])
    case logout

    
    var baseUrl: URL {
        return URL(string: "\(NetWorkManager.shared.baseURL)/account/api/")!
    }
    
    var method: HTTPMethod {
        switch self {
        case .login: return .post
        case .refreshToken: return .post
        case .register: return .post
        case .logout: return .post
        }
    }
    
    var path: String {
        switch self {
        case .login: return "login/"
        case .refreshToken: return "refreshToken/"
        case .register: return "register/"
        case .logout: return "logout/"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseUrl.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.method = method
        
        switch self {
        case .login(let parameters): request = try JSONEncoding.default.encode(request, with: [
            "phone" : parameters.phone ?? "",
            "password" : parameters.password ?? "",
            "system_code" : parameters.systemCode ?? "",
        ])
        case .register(let parameter): request = try JSONParameterEncoder().encode(parameter, into: request)
        case .logout: request = try JSONEncoding.default.encode(request, with: nil)
        case .refreshToken(let parameter): request = try JSONEncoding.default.encode(request, with: ["parameter" : parameter])
        }
        return request

    }
}

protocol AuthRepository {
    func login(payload: LoginPayloadModel, complete: ((BaseResponseModel<LoginResponseModel>) -> Void)?)
}

class AuthRepositoryImpl: AuthRepository {
    func login(payload: LoginPayloadModel, complete: ((BaseResponseModel<LoginResponseModel>) -> Void)?) {
        NetWorkManager.shared.callApi(of: BaseResponseModel<LoginResponseModel>.self, router: AuthRouter.login(payload)) { response in
            print("-======\(response.statusCode)")
            complete?(response)
        } failure: { err in
            print("-======\(err)")
            complete?(
                BaseResponseModel<LoginResponseModel>(
                    statusCode: 400, message: err, data: nil
                )
            )
        }

    }
}
