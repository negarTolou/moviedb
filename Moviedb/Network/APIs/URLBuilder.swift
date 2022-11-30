//
//  URLBuilder.swift
//  Moviedb
//
//  Created by Negar Tolou on 29.11.22.
//

import Foundation

enum UrlError: Error {
    case invalidURL
    case invalidComponents
}

struct URLBuilder {
    private let api: API

    init(api: API) {
        self.api = api
    }

    func build() throws -> URLRequest {
        guard var url = URL(string: api.baseURL) else {throw UrlError.invalidURL}
        url.append(path: api.path)
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {throw UrlError.invalidComponents}
        components.queryItems = api.queries.compactMap { URLQueryItem(name: $0.key, value: $0.value) }
        guard let urlComponents = components.url else {throw UrlError.invalidURL}
        var request = URLRequest(url: urlComponents)
        request.httpMethod = api.method.rawValue

        return request
    }
}
