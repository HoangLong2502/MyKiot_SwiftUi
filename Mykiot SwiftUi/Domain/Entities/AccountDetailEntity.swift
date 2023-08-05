//
//  AccountDetailEntity.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 04/08/2023.
//

import Foundation

struct AccountDetailEntity: Decodable {
    let id: Int?
    let avatar: String?
    let fullName: String?
    let code: String?
    let storeName: String?
    let phone: String?
    let webSite: String?
    let email: String?
    let address: AddressDetailEntity?
    let cardBank: CardBankEntity?
}

struct CardBankEntity: Decodable {
    
}

struct AddressDetailEntity: Decodable {
    let title: String?
    let lat: Double?
    let long: Double?
    let province: LocationDataEntity?
    let district: LocationDataEntity?
    let ward: LocationDataEntity?
}
