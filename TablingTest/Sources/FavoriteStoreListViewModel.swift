//
//  FavoriteStoreListViewModel.swift
//  TablingTest
//
//  Created by Minseob on 2022/05/14.
//

import RxSwift

final class FavoriteStoreListViewModel {
    private let repository: FavoriteStoreRepositoryType
    init(repository: FavoriteStoreRepositoryType = DefaultFavoriteStoreRepository()) {
        self.repository = repository
    }

    var numberOfRows: Int {
        return currentList.count
    }

    func fetchSavedList() -> Observable<[Store]> {
        repository.fetchSavedList()
            .do { [weak self] stores in
                self?.savedList.append(contentsOf: stores)
            }
    }

    func fetchRecentlyList() -> Observable<[Store]> {
        repository.fetchRecentlyList()
            .do { [weak self] stores in
                self?.recentlyList.append(contentsOf: stores)
            }
    }

    func selectListType(_ type: FavoriteStoreListType) {
        switch type {
        case .saved:
            currentList = savedList
        case .recently:
            currentList = recentlyList
        }
    }

    func store(for row: Int) -> Store? {
        currentList[safe: row]
    }

    // State
    private var currentList: [Store] = []
    private var savedList: [Store] = []
    private var recentlyList: [Store] = []
}
