//
//  BaseInfiniteScrollViewModel.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 09/08/2023.
//

import Foundation
import SwiftUI
import SwiftUI_Pull_To_Refresh

class BaseInfiniteScrollVM<T: Hashable>: ObservableObject {
    @Published var items = [T]()
    @Published var isLoading = false
    
    var page: Int
    var limit: Int
    var getData: ()
    
    init(page: Int, limit: Int) {
        self.page = page
        self.limit = limit
    }
    
    func loadMore(_ getItem: ((_ page: Int,_ limit: Int,_ onComplete: (_ item: [T]) -> Void) -> Void)? = nil) {
        guard !isLoading else { return }

        isLoading = true
        
        getItem?(page, limit) { items in
            self.items = self.items + items
            self.page += 1
            isLoading = false
        }
    }
    
    func refresh(refreshComplete: RefreshComplete) {
        //subscriptions.forEach { $0.cancel() }
        items.removeAll()
        isLoading = false
        page = 1
        loadMore()
        refreshComplete()
    }
}
