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
    let cardBank: [CardBankEntity]?
}

struct CardBankEntity: Decodable, Hashable {
    let id: Int?
    let fullName, cardNumber: String?
    let status: Bool?
    let qrcode, expriryDate, cvv: String?
    let cardType, bank, account: Int?
    let bankId: Int?
    let bankTitle, bankCode, bankShortName, bankImg, bankBin, bankSwiftCode: String?
    let cardId: Int?
    let cardTitle, cardCode: String?
}

struct AddressDetailEntity: Decodable {
    let title: String?
    let lat: Double?
    let long: Double?
    let province: LocationDataEntity?
    let district: LocationDataEntity?
    let ward: LocationDataEntity?
}
