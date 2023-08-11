//
//  AccountDetailMapper.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 05/08/2023.
//

import Foundation

class AccountDetailMapper: BaseDataMapper {
    
    typealias I = AccountDetailModel
    
    typealias M = AccountDetailEntity
    
    private let cardBankMapper: CardBankEntityMapper = CardBankEntityMapper()
    
    func mapToEntity(data: AccountDetailModel?) -> AccountDetailEntity {
        return AccountDetailEntity(
            id: data?.id,
            avatar: data?.avatar,
            fullName: data?.fullName,
            code: data?.keyAccount,
            storeName: data?.shopData?.title,
            phone: data?.phone,
            webSite: "dat",
            email: data?.email,
            address: AddressDetailEntity(
                title: data?.addressData?.title,
                lat: data?.addressData?.lat,
                long: data?.addressData?.long,
                province: LocationDataEntity(
                    id: data?.addressData?.provinceData?.id,
                    title: data?.addressData?.provinceData?.title
                ),
                district: LocationDataEntity(
                    id: data?.addressData?.districtData?.id,
                    title: data?.addressData?.districtData?.title
                ),
                ward: LocationDataEntity(
                    id: data?.addressData?.wardData?.id,
                    title: data?.addressData?.wardData?.title
                )
            ),
            cardBank: cardBankMapper.mapToListEntity(listData: data?.cardData)
        )
    }
}
