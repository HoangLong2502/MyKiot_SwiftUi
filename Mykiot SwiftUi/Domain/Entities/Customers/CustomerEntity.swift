import Foundation

struct CustomerEntity: Decodable, Hashable {
    var id: Int?
    var fullName: String?
    var phone: String?
    var image: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case fullName
        case phone
        case image
    }
}
