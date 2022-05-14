//
//  FavoriteStoreRepository.swift
//  TablingTest
//
//  Created by Minseob on 2022/05/14.
//

import Foundation

protocol FavoriteStoreRepositoryType {
    func fetchSavedList()
}

final class DefaultFavoriteStoreRepository: FavoriteStoreRepositoryType {
    func fetchSavedList() {
        
    }
}
