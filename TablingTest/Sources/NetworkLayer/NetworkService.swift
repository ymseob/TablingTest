//
//  NetworkService.swift
//  TablingTest
//
//  Created by Minseob on 2022/05/14.
//

import RxSwift
import Alamofire

protocol NetworkServiceType {
    func request(api: API) -> Single<Data?>
}

struct NetworkService: NetworkServiceType {
    func request(api: API) -> Single<Data?> {
        .create { single in
            let url = api.domain + api.path
            let request = AF.request(
                url,
                method: api.method,
                parameters: api.parameters,
                encoding: api.encoding,
                headers: api.headerFields
            )

            request.response { afResponse in
                let httpResponse = afResponse.response
                let statusCode = httpResponse?.statusCode ?? -999
                switch statusCode {
                case 200..<300:
                    single(.success(afResponse.data))
                default:
                    let error = NSError(domain: "NetworkResponseErrorDomain", code: statusCode, userInfo: [:])
                    single(.failure(error))
                }
            }

            return Disposables.create {
                request.cancel()
            }
        }
    }
}
