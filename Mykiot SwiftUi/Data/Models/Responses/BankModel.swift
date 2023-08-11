// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let bankModel = try BankModel(json)

import Foundation

// MARK: - BankModel
struct BankModel: Codable {
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

// MARK: BankModel convenience initializers and mutators

extension BankModel {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(BankModel.self, from: data)
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
    ) -> BankModel {
        return BankModel(
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
