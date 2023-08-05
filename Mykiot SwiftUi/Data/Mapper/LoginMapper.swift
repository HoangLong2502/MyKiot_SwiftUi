import Foundation

class LoginEntityMapper: BaseDataMapper {

    typealias I = LoginResponseModel
    
    typealias M = LoginEntity
    
    func mapToEntity(data: LoginResponseModel?) -> LoginEntity {
        return LoginEntity(
            accessToken: data?.token
        )
    }
}
