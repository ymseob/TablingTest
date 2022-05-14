//
//  FavoriteStoreRepository.swift
//  TablingTest
//
//  Created by Minseob on 2022/05/14.
//

import RxSwift

protocol FavoriteStoreRepositoryType {
    func fetchSavedList() -> Observable<[Store]>
    func fetchRecentlyList() -> Observable<[Store]>
}

final class DefaultFavoriteStoreRepository: FavoriteStoreRepositoryType {
    private let service: NetworkServiceType

    init(service: NetworkServiceType = NetworkService()) {
        self.service = service
    }

    func fetchSavedList() -> Observable<[Store]> {
        return service.request(api: SavedListAPI())
            .compactMap { $0 }
            .compactMap { data -> Data? in
                try NestedParser().parse(data: data, atKeyPath: "list")
            }
            .compactMap { data -> [Store]? in
                try? JSONDecoder().decode([Store].self, from: data)
            }
            .asObservable()
    }

    func fetchRecentlyList() -> Observable<[Store]> {
        return service.request(api: RecentlyListAPI())
            .compactMap { $0 }
            .compactMap { data -> Data? in
                try NestedParser().parse(data: data, atKeyPath: "list")
            }
            .compactMap { data -> [Store]? in
                try? JSONDecoder().decode([Store].self, from: data)
            }
            .asObservable()
    }
}
