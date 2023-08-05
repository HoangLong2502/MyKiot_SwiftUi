//
//  AccountInfoViewModel.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 04/08/2023.
//

import SwiftUI
import Alamofire
import MapKit

class AccountInfoViewModel: ObservableObject {
    @Published var settingItems: [SettingItemEntity] = [
        SettingItemEntity(title: "Thông tin cá nhân", bgColor: Color.blue_2, color: Color.blue_1, destination: AnyView(InfoPage()), iconSystem: "info.bubble.fill", delayAnimation: 0),
        SettingItemEntity(title: "Cài đặt địa chỉ", bgColor: Color.green_2, color: Color.green_1, destination: AnyView(AddressPage()), iconSystem: "map.fill", delayAnimation: 0.2),
        SettingItemEntity(title: "Thẻ ngân hàng", bgColor: Color.yellow_2, color: Color.yellow_1, destination: AnyView(BankPage()), iconSystem: "creditcard.fill", delayAnimation: 0.4),
        SettingItemEntity(title: "Đổi mật khẩu", bgColor: Color.red_2, color: Color.red_1, destination: AnyView(ChangePasswordPage()), iconSystem: "key.horizontal.fill", delayAnimation: 0.6)
    ]
    @Published var isVisible = Array(repeating: false, count: 4)
    @Published var accountDetailEntity: AccountDetailEntity?
    
    // MARK: - MAP
    @Published var coordinate: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 20.98062507180723, longitude: 105.76688407301575), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    @Published var markers: [MapMarkerItem] = []
    
    private let accountDetailUseCase: AccountDetailUseCase = AccountDetailUseCase()
    
    func getDetailAccount() {
        let input = AccountDetailInput()
        accountDetailUseCase.buildUseCase(input: input) { res in
            if let accountEntity = res.response.data {
                self.accountDetailEntity = accountEntity
                
                if let lat = accountEntity.address?.lat, let long = accountEntity.address?.long {
                    self.coordinate = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: lat, longitude: long), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
                    
                    self.markers = [
                        MapMarkerItem(coordinate: CLLocationCoordinate2D(latitude: lat, longitude: long))
                    ]
                }
            }
        }
    }
}

protocol DestinationView: View {
    // This protocol doesn't require any specific implementation
    // It simply enforces that conforming types must be Views
}


class SettingItemEntity: Identifiable {
    let title: String
    let bgColor: Color
    let color: Color
    let destination: AnyView
    let iconSystem: String
    let delayAnimation: Double
    
    enum CodingKeys: String, CodingKey {
        case title
        case bgColor
        case color
        case destination
        case iconSystem, offsetX
    }
    
    init(title: String, bgColor: Color, color: Color, destination: AnyView, iconSystem: String, delayAnimation: Double) {
        self.title = title
        self.bgColor = bgColor
        self.color = color
        self.destination = destination
        self.iconSystem = iconSystem
        self.delayAnimation = delayAnimation
    }
}
