import Foundation
import KeychainSwift

class AuthService {
    static var shared = AuthService()
    private var keychanin: KeychainSwift
    
    private enum Keys: String {
        case kAccessToken
        case kRefreshToken
    }
    
    private init() {
        keychanin = KeychainSwift()
    }
    
    var accessToken : String {
        get {
            return keychanin.get(Keys.kAccessToken.rawValue) ?? ""
        }
        set {
            keychanin.set(newValue, forKey: Keys.kAccessToken.rawValue)
        }
    }
    
    var refreshToken: String {
        get {
            return keychanin.get(Keys.kRefreshToken.rawValue) ?? ""
        }
        set {
            keychanin.set(newValue, forKey: Keys.kRefreshToken.rawValue)
        }
    }
    
    var isLoggedIn: Bool {
        return !accessToken.isEmpty
    }
    
    func clearAll() {
        keychanin.clear()
    }
}
