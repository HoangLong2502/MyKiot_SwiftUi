//
//  ProvinceUseCase.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 01/08/2023.
//

import Foundation

class ProvinceUseCase: BaseUseCase {
    
    typealias I = ProvinceInput
    
    typealias O = ProvinceOutput
    
    let locationRepository: LocationRepository = LocationRepositoryImpl()
    let locationMapper: LocationDataMapper = LocationDataMapper()
    
    func buildUseCase(input: ProvinceInput, complete: ((ProvinceOutput) -> Void)?) {
        locationRepository.getProvinces { res in
            let dataEntities = self.locationMapper.mapToListEntity(listData: res.data)
            complete?(ProvinceOutput(response: BaseResponseModel(
                statusCode: res.statusCode,
                message: res.message,
                data: dataEntities
            )))
        }
    }
}

class ProvinceInput: BaseInput {
    
}

class ProvinceOutput: BaseOutput {
    let response: BaseResponseModel<[LocationDataEntity]>
    
    init(response: BaseResponseModel<[LocationDataEntity]>) {
        self.response = response
    }
}
