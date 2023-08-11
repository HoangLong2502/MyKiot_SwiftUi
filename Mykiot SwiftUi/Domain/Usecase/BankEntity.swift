//
//  BankEntity.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 07/08/2023.
//

import Foundation

struct BankEntity: Decodable, Hashable {
    let id: Int?
    let title, code, shortName, imgUrl, bin, swiftCode: String?
    
    enum CondingKeys: String, CodingKey {
        case id, title, code, bin, swiftCode
        case shortName = "short_name"
        case imgUrl = "img_url"
    }
}
