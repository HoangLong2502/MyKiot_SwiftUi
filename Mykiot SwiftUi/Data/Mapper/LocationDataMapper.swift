//
//  LocationDataMapper.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 01/08/2023.
//

import Foundation

class LocationDataMapper: BaseDataMapper {
    func mapToEntity(data: LocationDataModel?) -> LocationDataEntity {
        return LocationDataEntity(
            id: data?.id,
            title: data?.title
        )
    }
    
    typealias I = LocationDataModel
    
    typealias M = LocationDataEntity

}
