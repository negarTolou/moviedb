//
//  APIRequest.swift
//  Moviedb
//
//  Created by Negar Tolou on 29.11.22.
//

import Foundation
protocol API {
    var path: String { get }
    var baseURL: String { get }
    var header: [String: String] { get }
    var method: URLRequestMethod { get }
    var queries: [String: String] { get }
    var acceptableStatusCodes: ClosedRange<Int> { get }
    var id: String? {set get}
}

extension API {
    var baseURL: String {
        return Constants.baseURL
    }
    var acceptableStatusCodes: ClosedRange<Int> {
        return 200...299
    }
    var queries: [String: String] { [:] }
}
