//
//  BaseInfiniteScroll.swift
//  Mykiot SwiftUi
//
//  Created by Mac on 09/08/2023.
//

//import SwiftUI
//import SwiftUI_Pull_To_Refresh
//public struct BaseInfiniteScroll<T, ItemView, LoadingView>: View where T: Hashable, ItemView: View, LoadingView: View {
//    @EnvironmentObject private var infiniteScrollVM: BaseInfiniteScrollVM<T>
//
//    let shinkWrap: Bool
//    let buildItem: ((_ item: T) -> ItemView)
//    let loadingView: LoadingView
//    let loadMore: () -> Void
//
//    public var body: some View {
//        RefreshableScrollView(onRefresh: onRefresh!) {
//            scrollableContent
//              .onAppear(perform: loadMore)
//        }
//    }
//
//    private var scrollableContent: some View {
//        Group {
//            if #available(iOS 14.0, *) {
//                LazyVStack(spacing: 10) {
//                    listItems
//                }
//            } else {
//                VStack(spacing: 10) {
//                    listItems
//                }
//            }
//        }
//    }
//
//    private var listItems: some View {
//        Group {
//            ForEach(infiniteScrollVM.items, id: \.self) { item in
//                buildItem(item)
//                    .onAppear {
//                        if item == infiniteScrollVM.items.last {
//                            loadMore()
//                        }
//                    }
//                }
//            if infiniteScrollVM.isLoading {
//                loadingView
//                    .frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .center)
//            }
//        }
//    }
//}
