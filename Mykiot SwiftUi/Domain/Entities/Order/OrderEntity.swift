import Foundation

struct OrderEntity: Decodable, Hashable {
    var id: Int?
    var title: String?
    var code: String?
    var totalPrice: Double?
    var createdAt: String?
    var customerAvatar: String?
    var customerName: String?
    var orderStatus: OrderStatusEntity?
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
    }
}

