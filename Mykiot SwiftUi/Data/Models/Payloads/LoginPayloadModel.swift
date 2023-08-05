import Foundation

// MARK: - LoginPayloadModel
struct LoginPayloadModel: Decodable {
    var phone, password, systemCode: String?

    enum CodingKeys: String, CodingKey {
        case phone, password
        case systemCode = "system_code"
    }
    
    var asDictionary : [String:Any] {
        let mirror = Mirror(reflecting: self)
        let dict = Dictionary(uniqueKeysWithValues: mirror.children.lazy.map({ (label:String?, value:Any) -> (String, Any)? in
          guard let label = label else { return nil }
          return (label, value)
        }).compactMap { $0 })
        return dict
      }
}
