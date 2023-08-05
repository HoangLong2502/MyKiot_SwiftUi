//
//  ProvinceUseCase.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 01/08/2023.
//

import Foundation

class WardUseCase: BaseUseCase {
    
    typealias I = WardInput
    
    typealias O = WardOutput
    
    let locationRepository: LocationRepository = LocationRepositoryImpl()
    let locationMapper: LocationDataMapper = LocationDataMapper()
    
    func buildUseCase(input: WardInput, complete: ((WardOutput) -> Void)?) {
        locationRepository.getWards(idDistrict: input.idDistrict) { res in
            let dataEntities = self.locationMapper.mapToListEntity(listData: res.data)
            complete?(WardOutput(response: BaseResponseModel(
                statusCode: res.statusCode,
                message: res.message,
                data: dataEntities
            )))
        }
    }
}

class WardInput: BaseInput {
    let idDistrict: Int
    
    init(idDistrict: Int) {
        self.idDistrict = idDistrict
    }
}

class WardOutput: BaseOutput {
    let response: BaseResponseModel<[LocationDataEntity]>
    
    init(response: BaseResponseModel<[LocationDataEntity]>) {
        self.response = response
    }
}
