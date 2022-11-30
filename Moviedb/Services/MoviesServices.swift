//
//  MoviesServices.swift
//  Moviedb
//
//  Created by Negar Tolou on 29.11.22.
//

import Foundation

enum ServiceError: Error {
    case invalideResponse
}

struct MovieListService {
    let session: Sessionable
    let parser: Parsable
    
    func fetch(api: MovieListAPI) async throws -> PopularMovieResponseModel {
        let response = try await session.request(builder: URLBuilder(api: api))
        
        if let httpResponse = response.1 as? HTTPURLResponse, api.acceptableStatusCodes.contains(httpResponse.statusCode) {
            return try parser.parse(data: response.0)
        }
        throw ServiceError.invalideResponse
    }
}

protocol Sessionable {
    func request(builder: URLBuilder) async throws -> (Data, URLResponse)
}
