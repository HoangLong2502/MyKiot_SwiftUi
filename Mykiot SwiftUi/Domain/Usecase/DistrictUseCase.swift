//
//  ProvinceUseCase.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 01/08/2023.
//

import Foundation

class DistrictUseCase: BaseUseCase {
    
    typealias I = DistrictInput
    
    typealias O = DistrictOutput
    
    let locationRepository: LocationRepository = LocationRepositoryImpl()
    let locationMapper: LocationDataMapper = LocationDataMapper()
    
    func buildUseCase(input: DistrictInput, complete: ((DistrictOutput) -> Void)?) {
        locationRepository.getDistricts(idProvince: input.idProvince) { res in
            let dataEntities = self.locationMapper.mapToListEntity(listData: res.data)
            complete?(DistrictOutput(response: BaseResponseModel(
                statusCode: res.statusCode,
                message: res.message,
                data: dataEntities
            )))
        }
    }
}

class DistrictInput: BaseInput {
    let idProvince: Int
    
    init(idProvince: Int) {
        self.idProvince = idProvince
    }
}

class DistrictOutput: BaseOutput {
    let response: BaseResponseModel<[LocationDataEntity]>
    
    init(response: BaseResponseModel<[LocationDataEntity]>) {
        self.response = response
    }
}
