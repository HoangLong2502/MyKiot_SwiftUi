import Foundation

struct BaseResponseModel<T: Decodable>: Decodable {
    var statusCode: Int?
    var message: String?
    var data: T?
    
    enum CodingKeys: String, CodingKey {
        case statusCode = "code"
        case message
        case data
    }
}

struct BaseResponseModel1<T: Decodable>: Decodable {
    var message: String?
    var data: T?
    var statusCode: Int?
    
    enum CodingKeys: String, CodingKey {
        case message
        case data
        case statusCode = "code"
    }
}

protocol DictionaryConvertor {
    func toDictionary() -> [String : Any]
}

extension DictionaryConvertor {
    
    func toDictionary() -> [String : Any] {
        let reflect = Mirror(reflecting: self)
        let children = reflect.children
        let dictionary = toAnyHashable(elements: children)
        return dictionary
    }
    
    func toAnyHashable(elements: AnyCollection<Mirror.Child>) -> [String : Any] {
        var dictionary: [String : Any] = [:]
        for element in elements {
            if let key = element.label {
                
                if let collectionValidHashable = element.value as? [AnyHashable] {
                    dictionary[key] = collectionValidHashable
                }
                
                if let validHashable = element.value as? AnyHashable {
                    dictionary[key] = validHashable
                }
                
                if let convertor = element.value as? DictionaryConvertor {
                    dictionary[key] = convertor.toDictionary()
                }
                
                if let convertorList = element.value as? [DictionaryConvertor] {
                    dictionary[key] = convertorList.map({ e in
                        e.toDictionary()
                    })
                }
            }
        }
        return dictionary
    }
}

func toDictionary<T: Codable>(from object: T) -> [String: String]? {
    let encoder = JSONEncoder()
    do {
        let data = try encoder.encode(object)
        let decodedObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: String]
        return decodedObject
    } catch {
        print("Error converting to dictionary: \(error)")
        return nil
    }
}

