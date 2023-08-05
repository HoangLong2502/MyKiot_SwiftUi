// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let productPayloadModel = try ProductPayloadModel(json)

import Foundation

// MARK: - ProductPayloadModel
struct ProductPayloadModel: Codable {
    var product: Product?
    var variant: [Variant]?
    var brand, productgroup, productcategory: Int?
    var listMediaVariant: [Bool]?

    enum CodingKeys: String, CodingKey {
        case product, variant, brand, productgroup, productcategory
        case listMediaVariant = "list_media_variant"
    }
}

// MARK: ProductPayloadModel convenience initializers and mutators

extension ProductPayloadModel {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(ProductPayloadModel.self, from: data)
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
        product: Product?? = nil,
        variant: [Variant]?? = nil,
        brand: Int?? = nil,
        productgroup: Int?? = nil,
        productcategory: Int?? = nil,
        listMediaVariant: [Bool]?? = nil
    ) -> ProductPayloadModel {
        return ProductPayloadModel(
            product: product ?? self.product,
            variant: variant ?? self.variant,
            brand: brand ?? self.brand,
            productgroup: productgroup ?? self.productgroup,
            productcategory: productcategory ?? self.productcategory,
            listMediaVariant: listMediaVariant ?? self.listMediaVariant
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Product
struct Product: Codable {
    var title, barcode: String?
    var priceSell, priceImport: Int?
    var description: String?
    var statusProduct, statusOnline: Bool?

    enum CodingKeys: String, CodingKey {
        case title, barcode
        case priceSell = "price_sell"
        case priceImport = "price_import"
        case description
        case statusProduct = "status_product"
        case statusOnline = "status_online"
    }
}

// MARK: Product convenience initializers and mutators

extension Product {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Product.self, from: data)
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
        barcode: String?? = nil,
        priceSell: Int?? = nil,
        priceImport: Int?? = nil,
        description: String?? = nil,
        statusProduct: Bool?? = nil,
        statusOnline: Bool?? = nil
    ) -> Product {
        return Product(
            title: title ?? self.title,
            barcode: barcode ?? self.barcode,
            priceSell: priceSell ?? self.priceSell,
            priceImport: priceImport ?? self.priceImport,
            description: description ?? self.description,
            statusProduct: statusProduct ?? self.statusProduct,
            statusOnline: statusOnline ?? self.statusOnline
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Variant
struct Variant: Codable {
    var title, barcode: String?
    var priceSell, priceImport, quantity: Int?
    var options: [Option]?

    enum CodingKeys: String, CodingKey {
        case title, barcode
        case priceSell = "price_sell"
        case priceImport = "price_import"
        case quantity, options
    }
}

// MARK: Variant convenience initializers and mutators

extension Variant {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Variant.self, from: data)
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
        barcode: String?? = nil,
        priceSell: Int?? = nil,
        priceImport: Int?? = nil,
        quantity: Int?? = nil,
        options: [Option]?? = nil
    ) -> Variant {
        return Variant(
            title: title ?? self.title,
            barcode: barcode ?? self.barcode,
            priceSell: priceSell ?? self.priceSell,
            priceImport: priceImport ?? self.priceImport,
            quantity: quantity ?? self.quantity,
            options: options ?? self.options
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Option
struct Option: Codable {
    var title, values: String?
}

// MARK: Option convenience initializers and mutators

extension Option {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Option.self, from: data)
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
        values: String?? = nil
    ) -> Option {
        return Option(
            title: title ?? self.title,
            values: values ?? self.values
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
