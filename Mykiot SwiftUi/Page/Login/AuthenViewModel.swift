
import Foundation
import SwiftUI

class AuthenViewModel: ObservableObject {
    @Published var isAuth = false
    
    func updateAuth(value: Bool) {
        withAnimation {
            isAuth = value
        }
    }
    
    func initData() {
        print("------------\(AuthService.shared.accessToken)")
        isAuth = AuthService.shared.isLoggedIn
    }
}
