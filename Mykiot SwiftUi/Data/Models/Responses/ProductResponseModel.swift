// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let productResponseModel = try? JSONDecoder().decode(ProductResponseModel.self, from: jsonData)

import Foundation

// MARK: - ProductResponseModel
struct ProductResponseModel: Decodable {
    var id: Int?
    var title, code, barcode: String?
    var priceSell: Double?
    var media: [Int]?
    var priceImport: Double?
    var statusProduct, statusOnline: Bool?
    var description: String?
    var system, account: Int?
    var mediaData: [MediaDatum]?
    var variantData: [VariantDatum]?
    var systemData: SystemData?
    var createdAt: String?
    var brandData, productcategoryData, productgroupData: [Datum]?

    enum CodingKeys: String, CodingKey {
        case id, title, code, barcode
        case priceSell = "price_sell"
        case media
        case priceImport = "price_import"
        case statusProduct = "status_product"
        case statusOnline = "status_online"
        case description, system, account
        case mediaData = "media_data"
        case variantData = "variant_data"
        case systemData = "system_data"
        case createdAt = "created_at"
        case brandData = "brand_data"
        case productcategoryData = "productcategory_data"
        case productgroupData = "productgroup_data"
    }
}

// MARK: - Datum
struct Datum: Decodable {
    var id: Int?
    var title: String?
}

// MARK: - MediaDatum
struct MediaDatum: Decodable {
    var id: Int?
    var image: String?
    var alt, createdAt: String?

    enum CodingKeys: String, CodingKey {
        case id, image, alt
        case createdAt = "created_at"
    }
}

// MARK: - VariantDatum
struct VariantDatum: Decodable {
    var id: Int?
    var title, code, barcode: String?
    var priceSell, priceImport: Double?
    var status: Bool?
    var quantity: Double?
    var image: String?
    var product, account: Int?
    var createdAt: String?
    var optionsData: [OptionsDatum]?
    var productTitle: String?
    var quantityInStock: Double?

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

// MARK: - OptionsDatum
struct OptionsDatum: Decodable {
    var id: Int?
    var title: String?
    var values: String?
    var status: Bool?
}

