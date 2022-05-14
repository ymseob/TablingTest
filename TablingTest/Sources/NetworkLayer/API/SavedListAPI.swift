//
//  SavedListAPI.swift
//  TablingTest
//
//  Created by Minseob on 2022/05/14.
//

import Foundation

final class SavedListAPI: API {
    var domain: String { Domain.test.rawValue }

    var path: String { "/tabling/tabling_mobile_test/save" }

    var method: HTTPMethod { .get }
}
