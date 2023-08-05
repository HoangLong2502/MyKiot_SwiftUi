//
//  ProductEntity.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 24/07/2023.
//

import Foundation

struct ProductEntity: Decodable, Hashable {
    var title: String?
    var code: String?
    var priceSell: Double?
    var image: [String]?
    
    enum CodingKeys: String, CodingKey {
        case title
        case code
        case priceSell
        case image
    }
}
