// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let orderResponseModel = try? JSONDecoder().decode(OrderResponseModel.self, from: jsonData)

import Foundation

// MARK: - OrderResponseModel
struct OrderResponseModel: Codable {
    var id: Int?
    var title, code: String?
    var total, discount: Double?
    var isOnline: Bool?
    var note: String?
    var status: Int?
    var statusOrderData: StatusOrderDataClass?
    var customer: Int?
    var customerData: CustomerData?
    var shop: Int?
    var shopData: ShopData?
    var orderitems: [Orderitem]?
    var createdAt, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id, title, code, total, discount
        case isOnline = "is_online"
        case note, status
        case statusOrderData = "status_order_data"
        case customer
        case customerData = "customer_data"
        case shop
        case shopData = "shop_data"
        case orderitems
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - CustomerData
struct CustomerData: Codable {
    var id: Int?
    var fullName, phone: String?
    var email, code: JSONNull?
    var address: Int?
    var addressData: AddressData?
    var birthday: JSONNull?
    var image: String?
    var gender: Int?
    var shop: [Int]?
    var genderData: StatusOrderDataClass?

    enum CodingKeys: String, CodingKey {
        case id
        case fullName = "full_name"
        case phone, email, code, address
        case addressData = "address_data"
        case birthday, image, gender, shop
        case genderData = "gender_data"
    }
}

// MARK: - AddressData
struct AddressData: Codable {
    var id: Int?
    var title: String?
    var lat, long: Double?
    var area, province, district, ward: Int?
    var areaData, provinceData, districtData, wardData: StatusOrderDataClass?

    enum CodingKeys: String, CodingKey {
        case id, title, lat, long, area, province, district, ward
        case areaData = "area_data"
        case provinceData = "province_data"
        case districtData = "district_data"
        case wardData = "ward_data"
    }
}

// MARK: - StatusOrderDataClass
struct StatusOrderDataClass: Codable {
    var id: Int?
    var title, code: String?
}

// MARK: - Orderitem
struct Orderitem: Codable {
    var id, quantity: Int?
    var price, discount, total: Double?
    var variant: Int?
    var variantData: VariantData?
    var createdAt: String?

    enum CodingKeys: String, CodingKey {
        case id, quantity, price, discount, total, variant
        case variantData = "variant_data"
        case createdAt = "created_at"
    }
}

// MARK: - VariantData
struct VariantData: Codable {
    var id: Int?
    var title, code, barcode: String?
    var priceSell, priceImport: Double?
    var status: Bool?
    var quantity: Double?
    var image: String?
    var product, account: Int?
    var createdAt: String?
    var optionsData: [JSONAny]?
    var productTitle: String?
    var quantityInStock: JSONNull?

    enum CodingKeys: String, CodingKey {
        case id, title, code, barcode
        case priceSell = "price_sell"
        case priceImport = "price_import"
        case status, quantity, image, product, account
        case createdAt = "created_at"
        case optionsData = "options_data"
        case productTitle = "product__title"
        case quantityInStock = "quantity_in_stock"
    }
}

// MARK: - ShopData
struct ShopData: Codable {
    var id: Int?
    var title: String?
    var account, bussinessType: Int?


    enum CodingKeys: String, CodingKey {
        case id, title, account
        case bussinessType = "bussiness_type"
    }
}

// MARK: - AccountData
struct AccountData: Codable {
    var id: Int?
    var fullName, phone: String?
    var userCreated: JSONNull?
    var isActive: Bool?

    enum CodingKeys: String, CodingKey {
        case id
        case fullName = "full_name"
        case phone
        case userCreated = "user_created"
        case isActive = "is_active"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
