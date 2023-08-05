// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let addressEntity = try AddressEntity(json)

import Foundation

// MARK: - AddressEntity
struct AddressEntity: Codable {
    var title, lat, long: String?
    var province, district, ward: Int?
}

// MARK: AddressEntity convenience initializers and mutators

extension AddressEntity {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(AddressEntity.self, from: data)
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
        ward: Int?? = nil
    ) -> AddressEntity {
        return AddressEntity(
            title: title ?? self.title,
            lat: lat ?? self.lat,
            long: long ?? self.long,
            province: province ?? self.province,
            district: district ?? self.district,
            ward: ward ?? self.ward
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

