import Foundation

protocol BaseUseCase {
    associatedtype I : BaseInput
    associatedtype O : BaseOutput
    func buildUseCase(input: I, complete: ((O) -> Void)?)
}
