// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let createCardPayloadModel = try CreateCardPayloadModel(json)

import Foundation

// MARK: - CreateCardPayloadModel
struct CreateCardPayloadModel: Codable {
    var cardNumber, fullName: String?
    var status: Bool?
    var cvv, expriryDate: String?
    var cardType, bank: Int?

    enum CodingKeys: String, CodingKey {
        case cardNumber = "card_number"
        case fullName = "full_name"
        case status, cvv
        case expriryDate = "expriry_date"
        case cardType = "card_type"
        case bank
    }
}

// MARK: CreateCardPayloadModel convenience initializers and mutators

extension CreateCardPayloadModel {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(CreateCardPayloadModel.self, from: data)
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
        cardNumber: String?? = nil,
        fullName: String?? = nil,
        status: Bool?? = nil,
        cvv: String?? = nil,
        expriryDate: String?? = nil,
        cardType: Int?? = nil,
        bank: Int?? = nil
    ) -> CreateCardPayloadModel {
        return CreateCardPayloadModel(
            cardNumber: cardNumber ?? self.cardNumber,
            fullName: fullName ?? self.fullName,
            status: status ?? self.status,
            cvv: cvv ?? self.cvv,
            expriryDate: expriryDate ?? self.expriryDate,
            cardType: cardType ?? self.cardType,
            bank: bank ?? self.bank
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
