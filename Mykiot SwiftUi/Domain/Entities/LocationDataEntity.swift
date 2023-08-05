import Foundation

struct LocationDataEntity: Decodable, Hashable {
    var id: Int?
    var title: String?
    
    enum CodingKeys: String, CodingKey {
        case id, title
    }
}
