//
//  OrderStatus.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 23/07/2023.
//

import Foundation
import SwiftUI

struct OrderStatusEntity: Decodable, Hashable {
    var id: Int?
    var title: String?
    var code: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
    }
}
