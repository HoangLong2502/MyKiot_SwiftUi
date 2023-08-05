// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let customerDataPayloadModel = try CustomerDataPayloadModel(json)

import Foundation

// MARK: - CustomerDataPayloadModel
struct CustomerDataPayloadModel: Codable {
    var customer: Customer?
    var address: Address?
}

// MARK: CustomerDataPayloadModel convenience initializers and mutators

extension CustomerDataPayloadModel {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CustomerDataPayloadModel.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        customer: Customer?? = nil,
        address: Address?? = nil
    ) -> CustomerDataPayloadModel {
        return CustomerDataPayloadModel(
            customer: customer ?? self.customer,
            address: address ?? self.address
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Address
struct Address: Codable {
    var title, lat, long: String?
    var province, district, ward, area: Int?
}

// MARK: Address convenience initializers and mutators

extension Address {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Address.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        title: String?? = nil,
        lat: String?? = nil,
        long: String?? = nil,
        province: Int?? = nil,
        district: Int?? = nil,
        ward: Int?? = nil,
        area: Int?? = nil
    ) -> Address {
        return Address(
            title: title ?? self.title,
            lat: lat ?? self.lat,
            long: long ?? self.long,
            province: province ?? self.province,
            district: district ?? self.district,
            ward: ward ?? self.ward,
            area: area ?? self.area
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Customer
struct Customer: Codable {
    var email, fullName, phone, birthday: String?
    var gender: Int?

    enum CodingKeys: String, CodingKey {
        case email
        case fullName = "full_name"
        case phone, birthday, gender
    }
}

// MARK: Customer convenience initializers and mutators

extension Customer {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Customer.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        email: String?? = nil,
        fullName: String?? = nil,
        phone: String?? = nil,
        birthday: String?? = nil,
        gender: Int?? = nil
    ) -> Customer {
        return Customer(
            email: email ?? self.email,
            fullName: fullName ?? self.fullName,
            phone: phone ?? self.phone,
            birthday: birthday ?? self.birthday,
            gender: gender ?? self.gender
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
