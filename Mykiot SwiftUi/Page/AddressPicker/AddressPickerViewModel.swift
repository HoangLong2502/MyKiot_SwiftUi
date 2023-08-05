//
//  AddressPickerViewModel.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 01/08/2023.
//

import Foundation
import CoreLocation
import MapKit
import _MapKit_SwiftUI

struct MapMarkerItem: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

class AddressPickerViewModel: ObservableObject {
    @Published var stepPicker: StepPickerLocation = .province
    @Published var dataLocation: [LocationDataEntity] = [LocationDataEntity]()
    @Published var searchKey: String = ""
    
    @Published var provinceSelected: LocationDataEntity? = nil
    @Published var districtSelected: LocationDataEntity? = nil
    @Published var wardSelected: LocationDataEntity? = nil
    
    @Published var lat: Double? = nil
    @Published var lng: Double? = nil
    
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 0, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    @Published var markers: [MapMarkerItem] = []
    
    let provinceUseCase: ProvinceUseCase = ProvinceUseCase()
    let districtUseCase: DistrictUseCase = DistrictUseCase()
    let wardUseCase: WardUseCase = WardUseCase()
    
    func getListProvince() {
        let input = ProvinceInput()
        provinceUseCase.buildUseCase(input: input) { res in
            guard let data = res.response.data else {
                return
            }
            self.dataLocation = data
        }
    }
    
    func getListDistrict() {
        let input = DistrictInput(idProvince: provinceSelected?.id ?? 0)
        districtUseCase.buildUseCase(input: input) { res in
            guard let data = res.response.data else {
                return
            }
            self.dataLocation = data
        }
    }
    
    func getListWard() {
        let input = WardInput(idDistrict: districtSelected?.id ?? 0)
        wardUseCase.buildUseCase(input: input) { res in
            guard let data = res.response.data else {
                return
            }
            self.dataLocation = data
        }
    }
    
    func complete(_ callBack: ((AddressEntity) -> Void)?) {
        guard let ward = wardSelected?.title else {
            return
        }
        guard let district = districtSelected?.title else {
            return
        }
        guard let province = provinceSelected?.title else {
            return
        }
        CLGeocoder().geocodeAddressString("\(searchKey), \(ward), \(district), \(province)") { (placemarks, error) in
            // Process Response
            guard let lat = placemarks?.first?.location?.coordinate.latitude else {
                return
            }
            guard let lng = placemarks?.first?.location?.coordinate.longitude else {
                return
            }
            self.lat = lat
            self.lng = lng
            self.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: self.lat ?? 0, longitude: self.lng ?? 0), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            self.markers = [
                MapMarkerItem(coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lng))
            ]
            
            let addressEntity = AddressEntity(
                title: "\(self.searchKey), \(ward), \(district), \(province)",
                lat: "\(lat)",
                long: "\(lng)",
                province: self.provinceSelected?.id,
                district: self.districtSelected?.id,
                ward: self.wardSelected?.id
            )
            
            callBack?(addressEntity)
        }
    }
    
    func selectLocation(_ data: LocationDataEntity) {
        if stepPicker == .province {
            provinceSelected = data
            stepPicker = .district
        } else if stepPicker == .district {
            districtSelected = data
            stepPicker = .ward
        } else if stepPicker == .ward  {
            wardSelected = data
            stepPicker = .detail
        }
    }
    
    func stepPickerChange() {
        if stepPicker == .province {
            provinceSelected = nil
            districtSelected = nil
            wardSelected = nil
            searchKey = ""
        } else if stepPicker == .district {
            districtSelected = nil
            wardSelected = nil
            searchKey = ""
        } else if stepPicker == .ward  {
            wardSelected = nil
            searchKey = ""
        } else {
            searchKey = ""
            dataLocation = []
        }
    }
}


enum StepPickerLocation {
    case province
    case district
    case ward
    case detail
    
    var title: String {
        switch self {
        case .province: return "Tỉnh / Thành phố"
        case .district: return "Quận / Huyện"
        case .ward: return "Phường / Xã"
        case .detail: return "Địa chỉ chi tiết"
        }
    }
}
