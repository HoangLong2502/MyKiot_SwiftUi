import Foundation

protocol BaseDataMapper {
    associatedtype I
    associatedtype M

    func mapToEntity(data: I?) -> M
    func mapToListEntity(listData: [I]?) -> [M]
}

extension BaseDataMapper {
    func mapToListEntity(listData: [I]?) -> [M] {
        return listData?.map { mapToEntity(data: $0) } ?? []
    }
}
