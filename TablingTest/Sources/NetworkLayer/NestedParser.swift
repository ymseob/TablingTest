//
//  NestedParser.swift
//  TablingTest
//
//  Created by Minseob on 2022/05/14.
//

import Foundation

struct NestedParser {
    func parse(data: Data, atKeyPath keyPath: String) throws -> Data? {
        let json = try JSONSerialization.jsonObject(with: data)
        guard let nested = (json as AnyObject).value(forKeyPath: keyPath) else {
            return nil
        }
        let data = try JSONSerialization.data(withJSONObject: nested)
        return data
    }
}
