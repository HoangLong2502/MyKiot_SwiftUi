import Foundation
import UIKit

class LoginUseCase: BaseUseCase {
    typealias I = LoginInput
    typealias O = LoginOutput
    
    private let authRepository: AuthRepository = AuthRepositoryImpl()
    private let loginMapper: LoginEntityMapper = LoginEntityMapper()
    
    func buildUseCase(input: I, complete: ((O) -> Void)?) {
        authRepository.login(payload: input.payload, complete: { response in
            let res = LoginOutput(response: BaseResponseModel(
                statusCode: response.statusCode, message: response.message, data: self.loginMapper.mapToEntity(data: response.data)
            ))
            complete?(res)
        })
    }
}

class LoginInput: BaseInput {
    let payload: LoginPayloadModel
    init(payload: LoginPayloadModel) {
        self.payload = payload
    }
}

class LoginOutput: BaseOutput {
    let response: BaseResponseModel<LoginEntity>
    init(response: BaseResponseModel<LoginEntity>) {
        self.response = response
    }
}
