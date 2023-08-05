//
//  CustomerCreateViewModel.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 01/08/2023.
//

import Foundation
import _PhotosUI_SwiftUI
import SwiftUI

class CustomerCreateViewModel: ObservableObject {
    @Published var fullName: String = ""
    @Published var gender: PickerItem?
    @Published var phone: String = ""
    @Published var email: String = ""
    @Published var birthDay: String = "2001-02-25"
    @Published var lat: String?
    @Published var long: String?
    @Published var province: Int?
    @Published var district: Int?
    @Published var ward: Int?
    @Published var addressDetail: String?
    
    @Published var avatar: PhotosPickerItem? = nil
    private var avatarData: Data? = nil
    @Published var avatarUI: Image? = nil
    @Published var listGender: [PickerItem] = [
        PickerItem(
            id: 1, title: "Nam"
        ),
        PickerItem(
            id: 2, title: "Nữ"
        ),
        PickerItem(
            id: 3, title: "Khác"
        )
    ]
    @Published var showOverlayNoti: Bool = false
    @Published var isLoading: Bool = false
    @Published var messageResponse: String? = nil
    
    let customerCreateUseCase: CustomerCreateUseCase = CustomerCreateUseCase()
    
    // MARK: - Func convert Image Type from PhotosPickerItem -> Image
    func onImageChange(image: PhotosPickerItem) {
        avatar?.loadTransferable(type: Data.self, completionHandler: { res in
            guard let data = try? res.get() else {
                return
            }
            self.avatarData = data
            guard let uiImage = UIImage(data: data) else {
                return
            }
            let image = Image(uiImage: uiImage)
            
            DispatchQueue.main.async {
                self.avatarUI = image
            }
        })
    }
    
    // MARK: - Func Create Customer
    func createCustomer() {
        self.showOverlayNoti = true
        self.isLoading = true
        let payload = CustomerDataPayloadModel(
            customer: Customer(
                email: email,
                fullName: fullName,
                phone: phone,
                birthday: birthDay,
                gender: gender?.id
            ),
            address: Address(
                title: addressDetail,
                lat: lat,
                long: long,
                province: province,
                district: district,
                ward: ward,
                area: 3
            )
        )
        let input = CustomerCreateInput(avatar: avatarData, payload: payload)
        customerCreateUseCase.buildUseCase(input: input) { res in
//            if let status = res.response.statusCode {
//
//            } else {
//
//            }
            self.isLoading = false
            self.messageResponse = res.response.message
        }
    }
}

struct PickerItem: Hashable {
    let id: Int
    let title: String
    
    init(id: Int, title: String) {
        self.id = id
        self.title = title
    }
}
