//
//  CardBankMapper.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 07/08/2023.
//

import Foundation

struct CardBankEntityMapper: BaseDataMapper {
    
    typealias I = CardDatum
    
    typealias M = CardBankEntity
    
    func mapToEntity(data: CardDatum?) -> CardBankEntity {
        return CardBankEntity(
            id: data?.id,
            fullName: data?.fullName,
            cardNumber: data?.cardNumber,
            status: data?.status,
            qrcode: data?.qrcode,
            expriryDate: data?.expriryDate,
            cvv: data?.cvv,
            cardType: data?.cardType,
            bank: data?.bank,
            account: data?.account,
            bankId: data?.bankData?.id,
            bankTitle: data?.bankData?.title,
            bankCode: data?.bankData?.code,
            bankShortName: data?.bankData?.shortName,
            bankImg: data?.bankData?.imgURL,
            bankBin: data?.bankData?.bin,
            bankSwiftCode: data?.bankData?.swiftCode,
            cardId: data?.cardTypeData?.id,
            cardTitle: data?.cardTypeData?.title,
            cardCode: data?.cardTypeData?.code
        )
    }
}
