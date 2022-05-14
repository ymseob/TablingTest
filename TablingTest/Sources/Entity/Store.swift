//
//  Store.swift
//  TablingTest
//
//  Created by Minseob on 2022/05/14.
//

import Foundation

struct Store: Decodable {
    let restaurantIdx: Int
    let thumbnail: URL
    let classification: String
    let rating: Double
    let restaurantName: String
    let reviewCount: Int
    let summaryAddress: String
    let isQuickBooking: Bool
    let isRemoteWaiting: Bool
    let useWaiting: Bool
    let useBooking: Bool
    let isNew: Bool
    let waitingCount: Int
}

extension Store {
    var waitingText: String {
        if waitingCount == .zero {
            return "대기 없음"
        }
        return "대기 \(waitingCount)팀"
    }

    var hasReview: Bool {
        reviewCount > .zero
    }

    var hasOption: Bool {
        isQuickBooking || isRemoteWaiting
    }

    var optionText: String {
        if isQuickBooking {
            return "즉시예약"
        }
        if isRemoteWaiting {
            return "원격줄서기"
        }
        return ""
    }
}
