//
//  NetworkManager.swift
//  Moviedb
//
//  Created by Negar Tolou on 29.11.22.
//

import Foundation
final class NetworkSession: Sessionable {
    let urlSession: URLSession
    
    init(session: URLSession = .shared) {
        self.urlSession = session
    }
    
    init() {
        let urlSession = URLSession(configuration: .default)
        
        self.urlSession = urlSession
    }
    
    func request(builder: URLBuilder) async throws -> (Data, URLResponse) {
        let request = try builder.build()
        return try await urlSession.data(for: request)
    }
}
