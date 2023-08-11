import Foundation
import UIKit
import MBProgressHUD
import LocalAuthentication

class LoginViewModel: ObservableObject {
    @Published var showProgressView = false
    @Published var isLoginSuccess = false
    @Published var isUnlocked = false
    
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
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?

        // check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // it's possible, so go ahead and use it
            let reason = "We need to unlock your data."

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // authentication has now completed
                if success {
                    // authenticated successfully
                    self.isUnlocked = true
                } else {
                    // there was a problem
                }
            }
        } else {
            // no biometrics
            print("DEVICE NOT FOUND")
        }
    }
}

