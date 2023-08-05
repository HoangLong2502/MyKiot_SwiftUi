import Foundation
import Alamofire

class NetWorkManager {
    static var shared = NetWorkManager()
    
    private let session: Session!
    
    let baseURL: String = "https://api.mykiot.com"
    
    private init() {
        session = Session(interceptor: AuthenticateHandler())
        session.sessionConfiguration.timeoutIntervalForRequest = 10
    }
    
    func callApi<T: Decodable>(of type: T.Type, router: URLRequestConvertible, success: ((T) -> Void)?, failure: ((String) -> Void)?) {
        session.request(router).cURLDescription { description in
            print(description)
        }
        .validate(statusCode: 200..<300)
        .response(completionHandler: { response in
            switch response.result {
            case .success(let data):
                print("========Ok========")
                guard let dataDecode = data else {
                    failure?("Data từ response type nil")
                    break
                }
                print(dataDecode.prettyPrintedJSONString!)
//                if let jsonString = String(data: dataDecode, encoding: .utf8) {
//                    print("JSON Data:", jsonString)
//                }
                do {
                    let decoder = JSONDecoder()
                    let entity = try decoder.decode(T.self, from: dataDecode)
                    success?(entity)
                } catch {
                    failure?("Decode thất bại \(error)")
                }
            case .failure(_):
                print("========Loi========")
                if let data = response.data {
                    do {
                        if (response.response?.statusCode) != nil {
                            
                        }
                        
                        let jsonObject: Any = try JSONSerialization.jsonObject(with: data, options: [])
                        
                        if let json = jsonObject as? [String: Any] {
                            failure?(json["message"] as? String ?? "Loi")
                        } else {
                            if let responseString = String(data: data, encoding: .utf8) {
                                failure?(responseString)
                            }
                        }
                    }
                    catch {
                        print("========Loi========")
                    }
                }
            }
        })
//        .responseDecodable(of: T.self) { response in
//            switch response.result {
//            case .success(let entity): success?(entity)
//            case .failure(_):
//                print("========Loi========")
//                if let data = response.data {
//                    do {
//                        if (response.response?.statusCode) != nil {
//
//                        }
//
//                        let jsonObject: Any = try JSONSerialization.jsonObject(with: data, options: [])
//
//                        if let json = jsonObject as? [String: Any] {
//                            failure?(json["message"] as? String ?? "Loi")
//                        } else {
//                            if let responseString = String(data: data, encoding: .utf8) {
//                                failure?(responseString)
//                            }
//                        }
//                    }
//                    catch {
//                        print("========Loi========")
//                    }
//                }
//            }
//        }
    }
    
    func uploadApi<T: Decodable>(of type: T.Type, router: URLRequestConvertible, multipartForm: MultipartFormData, success: ((T) -> Void)?, failure: ((String) -> Void)?) {
        session.upload(multipartFormData: multipartForm, with: router)
            .cURLDescription { description in
                print(description)
            }
            .response(completionHandler: { response in
                switch response.result {
                case .success(let data):
                    print("========Ok========")
                    guard let dataDecode = data else {
                        failure?("Data từ response type nil")
                        break
                    }
                    if let jsonString = String(data: dataDecode, encoding: .utf8) {
                        print("JSON Data:", jsonString)
                    }
                    do {
                        let decoder = JSONDecoder()
                        let entity = try decoder.decode(T.self, from: dataDecode)
                        success?(entity)
                    } catch {
                        failure?("Decode thất bại \(error)")
                    }
                case .failure(_):
                    print("========Loi========")
                    if let data = response.data {
                        do {
                            if (response.response?.statusCode) != nil {
                                
                            }
                            
                            let jsonObject: Any = try JSONSerialization.jsonObject(with: data, options: [])
                            
                            if let json = jsonObject as? [String: Any] {
                                failure?(json["message"] as? String ?? "Loi")
                            } else {
                                if let responseString = String(data: data, encoding: .utf8) {
                                    failure?(responseString)
                                }
                            }
                        }
                        catch {
                            print("========Loi========")
                        }
                    }
                }
            })
    }
}
