//
//  Array+Extension.swift
//  ABLY
//
//  Created by Orion on 2022/04/14.
//

import Foundation

extension Array {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
