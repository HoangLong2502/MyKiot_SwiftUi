// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let accountDetailModel = try AccountDetailModel(json)

import Foundation

// MARK: - AccountDetailModel
struct AccountDetailModel: Codable {
    var id: Int?
    var phone, email, keyAccount, fullName: String?
    var birthday, avatar: String?
//    var createdAt: Date?
    var isActive: Bool?
    var addressData: AddressData?
    var genderData, systemData: GenderDataClass?
    var cardData: [CardDatum]?
    var shopData: ShopData?
    var warehouseData: [WarehouseDatum]?

    enum CodingKeys: String, CodingKey {
        case id, phone, email
        case keyAccount = "key_account"
        case fullName = "full_name"
        case birthday, avatar
//        case createdAt = "created_at"
        case isActive = "is_active"
        case addressData = "address_data"
        case genderData = "gender_data"
        case systemData = "system_data"
        case cardData = "card_data"
        case shopData = "shop_data"
//        case warehouseData = "warehouse_data"
    }
}

// MARK: AccountDetailModel convenience initializers and mutators

extension AccountDetailModel {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(AccountDetailModel.self, from: data)
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
        phone: String?? = nil,
        email: String?? = nil,
        keyAccount: String?? = nil,
        fullName: String?? = nil,
        birthday: String?? = nil,
        avatar: String?? = nil,
//        createdAt: Date?? = nil,
        isActive: Bool?? = nil,
        addressData: AddressData?? = nil,
        genderData: GenderDataClass?? = nil,
        systemData: GenderDataClass?? = nil,
        cardData: [CardDatum]?? = nil,
        shopData: ShopData?? = nil
//        warehouseData: [WarehouseDatum]?? = nil
    ) -> AccountDetailModel {
        return AccountDetailModel(
            id: id ?? self.id,
            phone: phone ?? self.phone,
            email: email ?? self.email,
            keyAccount: keyAccount ?? self.keyAccount,
            fullName: fullName ?? self.fullName,
            birthday: birthday ?? self.birthday,
            avatar: avatar ?? self.avatar,
//            createdAt: createdAt ?? self.createdAt,
            isActive: isActive ?? self.isActive,
            addressData: addressData ?? self.addressData,
            genderData: genderData ?? self.genderData,
            systemData: systemData ?? self.systemData,
            cardData: cardData ?? self.cardData,
            shopData: shopData ?? self.shopData
//            warehouseData: warehouseData ?? self.warehouseData
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
//struct GenderDataClass: Codable {
//    var id: Int?
//    var title, code: String?
//    var system: Int?
//}

// MARK: GenderDataClass convenience initializers and mutators

//extension GenderDataClass {
//    init(data: Data) throws {
//        self = try newJSONDecoder().decode(GenderDataClass.self, from: data)
//    }
//
//    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//
//    init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }
//
//    func with(
//        id: Int?? = nil,
//        title: String?? = nil,
//        code: String?? = nil,
//        system: Int?? = nil
//    ) -> GenderDataClass {
//        return GenderDataClass(
//            id: id ?? self.id,
//            title: title ?? self.title,
//            code: code ?? self.code,
//            system: system ?? self.system
//        )
//    }
//
//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }
//
//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
//}

// MARK: - CardDatum
struct CardDatum: Codable {
    var id: Int?
    var fullName, cardNumber: String?
    var status: Bool?
    var qrcode, expriryDate: String?
    var cvv, cardType, bank, account: Int?
    var bankData: BankData?
    var cardTypeData: GenderDataClass?

    enum CodingKeys: String, CodingKey {
        case id
        case fullName = "full_name"
        case cardNumber = "card_number"
        case status, qrcode
        case expriryDate = "expriry_date"
        case cvv
        case cardType = "card_type"
        case bank, account
        case bankData = "bank_data"
        case cardTypeData = "card_type_data"
    }
}

// MARK: CardDatum convenience initializers and mutators

extension CardDatum {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CardDatum.self, from: data)
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
        cardNumber: String?? = nil,
        status: Bool?? = nil,
        qrcode: String?? = nil,
        expriryDate: String?? = nil,
        cvv: Int?? = nil,
        cardType: Int?? = nil,
        bank: Int?? = nil,
        account: Int?? = nil,
        bankData: BankData?? = nil,
        cardTypeData: GenderDataClass?? = nil
    ) -> CardDatum {
        return CardDatum(
            id: id ?? self.id,
            fullName: fullName ?? self.fullName,
            cardNumber: cardNumber ?? self.cardNumber,
            status: status ?? self.status,
            qrcode: qrcode ?? self.qrcode,
            expriryDate: expriryDate ?? self.expriryDate,
            cvv: cvv ?? self.cvv,
            cardType: cardType ?? self.cardType,
            bank: bank ?? self.bank,
            account: account ?? self.account,
            bankData: bankData ?? self.bankData,
            cardTypeData: cardTypeData ?? self.cardTypeData
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - BankData
struct BankData: Codable {
    var id: Int?
    var title, code, shortName: String?
    var imgURL: String?
    var bin, swiftCode: String?

    enum CodingKeys: String, CodingKey {
        case id, title, code
        case shortName = "short_name"
        case imgURL = "img_url"
        case bin, swiftCode
    }
}

// MARK: BankData convenience initializers and mutators

extension BankData {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(BankData.self, from: data)
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
        code: String?? = nil,
        shortName: String?? = nil,
        imgURL: String?? = nil,
        bin: String?? = nil,
        swiftCode: String?? = nil
    ) -> BankData {
        return BankData(
            id: id ?? self.id,
            title: title ?? self.title,
            code: code ?? self.code,
            shortName: shortName ?? self.shortName,
            imgURL: imgURL ?? self.imgURL,
            bin: bin ?? self.bin,
            swiftCode: swiftCode ?? self.swiftCode
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - ShopData
//struct ShopData: Codable {
//    var id: Int?
//    var title, code, subdomain, description: String?
//    var settings: Settings?
//    var bussinessType, account: Int?
//    var createdAt, updatedAt: String?
//    var businessTypeData: GenderDataClass?
//
//    enum CodingKeys: String, CodingKey {
//        case id, title, code, subdomain, description, settings
//        case bussinessType = "bussiness_type"
//        case account
//        case createdAt = "created_at"
//        case updatedAt = "updated_at"
//        case businessTypeData = "business_type_data"
//    }
//}

// MARK: ShopData convenience initializers and mutators

//extension ShopData {
//    init(data: Data) throws {
//        self = try newJSONDecoder().decode(ShopData.self, from: data)
//    }
//
//    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//
//    init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }
//
//    func with(
//        id: Int?? = nil,
//        title: String?? = nil,
//        code: String?? = nil,
//        subdomain: String?? = nil,
//        description: String?? = nil,
//        settings: Settings?? = nil,
//        bussinessType: Int?? = nil,
//        account: Int?? = nil,
//        createdAt: String?? = nil,
//        updatedAt: String?? = nil,
//        businessTypeData: GenderDataClass?? = nil
//    ) -> ShopData {
//        return ShopData(
//            id: id ?? self.id,
//            title: title ?? self.title,
//            code: code ?? self.code,
//            subdomain: subdomain ?? self.subdomain,
//            description: description ?? self.description,
//            settings: settings ?? self.settings,
//            bussinessType: bussinessType ?? self.bussinessType,
//            account: account ?? self.account,
//            createdAt: createdAt ?? self.createdAt,
//            updatedAt: updatedAt ?? self.updatedAt,
//            businessTypeData: businessTypeData ?? self.businessTypeData
//        )
//    }
//
//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }
//
//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
//}

// MARK: - Settings
//struct Settings: Codable {
//    var contact, openTime, closeTime: String?
//
//    enum CodingKeys: String, CodingKey {
//        case contact
//        case openTime = "open_time"
//        case closeTime = "close_time"
//    }
//}

// MARK: Settings convenience initializers and mutators

//extension Settings {
//    init(data: Data) throws {
//        self = try newJSONDecoder().decode(Settings.self, from: data)
//    }
//
//    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
//        guard let data = json.data(using: encoding) else {
//            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
//        }
//        try self.init(data: data)
//    }
//
//    init(fromURL url: URL) throws {
//        try self.init(data: try Data(contentsOf: url))
//    }
//
//    func with(
//        contact: String?? = nil,
//        openTime: String?? = nil,
//        closeTime: String?? = nil
//    ) -> Settings {
//        return Settings(
//            contact: contact ?? self.contact,
//            openTime: openTime ?? self.openTime,
//            closeTime: closeTime ?? self.closeTime
//        )
//    }
//
//    func jsonData() throws -> Data {
//        return try newJSONEncoder().encode(self)
//    }
//
//    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
//        return String(data: try self.jsonData(), encoding: encoding)
//    }
//}

// MARK: - WarehouseDatum
struct WarehouseDatum: Codable {
    var id: Int?
    var title, code: String?
    var warehouseType, address: Int?
    var addressData: AddressData?
    var system, account: Int?
    var createdAt: Date?

    enum CodingKeys: String, CodingKey {
        case id, title, code
        case warehouseType = "warehouse_type"
        case address
        case addressData = "address_data"
        case system, account
        case createdAt = "created_at"
    }
}

// MARK: WarehouseDatum convenience initializers and mutators

extension WarehouseDatum {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(WarehouseDatum.self, from: data)
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
        code: String?? = nil,
        warehouseType: Int?? = nil,
        address: Int?? = nil,
        addressData: AddressData?? = nil,
        system: Int?? = nil,
        account: Int?? = nil,
        createdAt: Date?? = nil
    ) -> WarehouseDatum {
        return WarehouseDatum(
            id: id ?? self.id,
            title: title ?? self.title,
            code: code ?? self.code,
            warehouseType: warehouseType ?? self.warehouseType,
            address: address ?? self.address,
            addressData: addressData ?? self.addressData,
            system: system ?? self.system,
            account: account ?? self.account,
            createdAt: createdAt ?? self.createdAt
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

