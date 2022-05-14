//
//  API.swift
//  TablingTest
//
//  Created by Minseob on 2022/05/14.
//

import Alamofire

protocol API {
    typealias HeaderField = HTTPHeaders
    typealias Encoding = ParameterEncoding
    typealias HTTPMethod = Alamofire.HTTPMethod
    typealias Parameter = Parameters

    var domain: String { get }

    var path: String { get }

    var method: HTTPMethod { get }

    var encoding: Encoding { get }

    var parameters: Parameter? { get }

    var headerFields: HeaderField? { get }
}

extension API {
    var parameters: Parameter? {
        return [:]
    }

    var encoding: Encoding {
        URLEncoding.default
    }

    var headerFields: HeaderField? {
        return [:]
    }
}
