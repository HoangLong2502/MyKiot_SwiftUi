import Foundation
import UIKit
import MBProgressHUD

class LoginViewModel: ObservableObject {
    @Published var showProgressView = false
    @Published var isLoginSuccess = false
    
    private let loginUseCase: LoginUseCase = LoginUseCase()
    
    func login(username: String, password: String, complete: ((Bool) -> Void)?) {
        showProgressView = true
        let input: LoginInput = LoginInput(payload: LoginPayloadModel(
            phone: username,
            password: password,
            systemCode: "CHTH"
        ))
        loginUseCase.buildUseCase(input: input) { response in
            self.showProgressView = false
            if response.response.statusCode == 200 {
                AuthService.shared.accessToken = response.response.data?.accessToken ?? ""
                print(AuthService.shared.accessToken)
                self.isLoginSuccess = true
                complete?(true)
            } else {
                complete?(false)
            }
        }
    }
}

