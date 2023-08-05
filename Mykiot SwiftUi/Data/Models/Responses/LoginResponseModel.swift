import Foundation

// MARK: - LoginResponseModel
struct LoginResponseModel: Decodable {
    var token: String?
//    var user: User?
}

// MARK: - User
struct User: Decodable {
    var id: Int?
    var phone, email, keyAccount, fullName: String?
    var businessType, businessTypeData, birthday, address: String?
    var avatar, parentAccount, userCreated: String?
//    var createdAt: Date?
    var system: Int?
    var systemData: SystemData?
    var addressData: AddressDataModel?

    enum CodingKeys: String, CodingKey {
        case id, phone, email
        case keyAccount = "key_account"
        case fullName = "full_name"
        case businessType = "business_type"
        case businessTypeData = "business_type_data"
        case birthday, address
        case addressData = "address_data"
        case avatar
        case parentAccount = "parent_account"
        case userCreated = "user_created"
//        case createdAt = "created_at"
        case system
        case systemData = "system_data"
    }
}

// MARK: - SystemData
struct SystemData: Decodable {
    var id: Int?
    var title, code: String?
}

// MARK: - AddressDataModel
struct AddressDataModel: Decodable {
    var id: Int?
    var title: String?
    var lat, long: Double?
    var area, province, district: Int?
//    var ward: JSONNull?
//    var settings: Settings?
    var areaData, provinceData, districtData: AreaDataClass?
//    var wardData: JSONNull?

    enum CodingKeys: String, CodingKey {
        case id, title, lat, long, area, province, district
        case areaData = "area_data"
        case provinceData = "province_data"
        case districtData = "district_data"
//        case wardData = "ward_data"
    }
}

// MARK: - AreaDataClass
struct AreaDataClass: Decodable {
    var id: Int?
    var title, code: String?
}
