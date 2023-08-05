import Foundation

struct LoginEntity: Decodable {
    var accessToken: String?
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "token"
    }
}
