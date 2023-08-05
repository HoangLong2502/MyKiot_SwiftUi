import Foundation
import Alamofire

class AuthenticateHandler: RequestInterceptor {
    private typealias RefreshCompletion = (_ succeeded: Bool, _ accessToken: String?) -> Void

    private let lock = NSLock()

    private var isRefreshing = false
    private var requestsToRetry: [(RetryResult) -> Void] = []

    // MARK: - RequestRetrier

    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var urlRequest = urlRequest
        if AuthService.shared.isLoggedIn {
            let accessToken = AuthService.shared.accessToken
//            urlRequest.headers.add(.authorization(bearerToken: accessToken))
            urlRequest.headers.add(.authorization("Token \(accessToken)"))
        }
        completion(.success(urlRequest))
    }
    
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        lock.lock(); defer { lock.unlock() }

        if let response = request.task?.response as? HTTPURLResponse, response.statusCode == 401 {
            requestsToRetry.append(completion)
            if !isRefreshing {
                refreshTokens { [weak self] succeeded, accessToken in
                    guard let strongSelf = self else { return }
                    strongSelf.lock.lock(); defer { strongSelf.lock.unlock() }

                    if succeeded {
                        strongSelf.requestsToRetry.forEach { retryCompletion in
                            retryCompletion(.retry)
                        }
                        strongSelf.requestsToRetry.removeAll()
                    } else {
                        strongSelf.handleRefreshTokenError()
                    }
                }
            }
        }
    }

    // MARK: - Private - Refresh Tokens

    private func refreshTokens(completion: @escaping RefreshCompletion) {
        guard !isRefreshing else { return }

        isRefreshing = true

        let router = AuthRouter.refreshToken(refreshToken: AuthService.shared.refreshToken)

//        NetWorkManager.shared.callApi(of: LoginEntity.self, router: router) { [weak self] (repsonse: LoginEntity) in
//            guard let strongSelf = self else { return }
//
//            strongSelf.isRefreshing = false
//
//            if let refresh = repsonse.refreshToken, let accessToken = repsonse.accessToken {
//                AuthService.shared.accessToken = accessToken
//                AuthService.shared.refreshToken = refresh
//                completion(true, refresh)
//            } else {
//                completion(false, nil)
//            }
//        } failure: { [weak self] error in
//            guard let strongSelf = self else { return }
//            strongSelf.isRefreshing = false
//            completion(false, nil)
//        }
    }

    private func handleRefreshTokenError() {
        AuthService.shared.clearAll()
        routeToAuthNavigation()
    }

    private func routeToAuthNavigation() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
        let nav = UINavigationController(rootViewController: vc)
//        nav.setNavigationBarHidden(true, animated: true)
//        (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController = nav
//        (UIApplication.shared.delegate as? AppDelegate)?.window?.makeKeyAndVisible()
    }
}
