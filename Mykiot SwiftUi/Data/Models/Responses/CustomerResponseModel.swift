// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let customerResponseModel = try CustomerResponseModel(json)

import Foundation

// MARK: - CustomerResponseModel
struct CustomerResponseModel: Codable {
    var id: Int?
    var fullName, phone: String?
    var email, code: String?
    var address: Int?
    var addressData: AddressData?
    var birthday: String?
    var image: String?
    var gender: Int?
//    var account, accountData, system, systemData: JSONNull?
    var shop: [Int]?
    var genderData: GenderDataClass?

    enum CodingKeys: String, CodingKey {
        case id
        case fullName = "full_name"
        case phone, email, code, address
        case addressData = "address_data"
        case birthday, image, gender//, account
//        case accountData = "account_data"
//        case system
//        case systemData = "system_data"
        case shop
        case genderData = "gender_data"
    }
}

// MARK: CustomerResponseModel convenience initializers and mutators

extension CustomerResponseModel {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CustomerResponseModel.self, from: data)
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
        id: Int?? = nil,
        fullName: String?? = nil,
        phone: String?? = nil,
        email: String?? = nil,
        code: String?? = nil,
        address: Int?? = nil,
        addressData: AddressData?? = nil,
        birthday: String?? = nil,
        image: String?? = nil,
        gender: Int?? = nil,
//        account: JSONNull?? = nil,
//        accountData: JSONNull?? = nil,
//        system: JSONNull?? = nil,
//        systemData: JSONNull?? = nil,
        shop: [Int]?? = nil,
        genderData: GenderDataClass?? = nil
    ) -> CustomerResponseModel {
        return CustomerResponseModel(
            id: id ?? self.id,
            fullName: fullName ?? self.fullName,
            phone: phone ?? self.phone,
            email: email ?? self.email,
            code: code ?? self.code,
            address: address ?? self.address,
            addressData: addressData ?? self.addressData,
            birthday: birthday ?? self.birthday,
            image: image ?? self.image,
            gender: gender ?? self.gender,
//            account: account ?? self.account,
//            accountData: accountData ?? self.accountData,
//            system: system ?? self.system,
//            systemData: systemData ?? self.systemData,
            shop: shop ?? self.shop,
            genderData: genderData ?? self.genderData
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - GenderDataClass
struct GenderDataClass: Codable {
    var id: Int?
    var title, code: String?
}

// MARK: GenderDataClass convenience initializers and mutators

extension GenderDataClass {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(GenderDataClass.self, from: data)
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
        id: Int?? = nil,
        title: String?? = nil,
        code: String?? = nil
    ) -> GenderDataClass {
        return GenderDataClass(
            id: id ?? self.id,
            title: title ?? self.title,
            code: code ?? self.code
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
