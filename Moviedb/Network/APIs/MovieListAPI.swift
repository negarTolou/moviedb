//
//  MovieListAPI.swift
//  Moviedb
//
//  Created by Negar Tolou on 29.11.22.
//

import Foundation
struct MovieListAPI: API {
    var id: String?
    

    var path: String {
        return "3/movie/popular"
    }
    var baseURL: String = Constants.baseURL
    var header: [String : String] = [:]
    var method: URLRequestMethod = .get
    
    var queries: [String : String] {
        return ["api_key": Constants.apiKey]
    }
}


struct MovieDetailAPI: API {

    var id: String?
    var path: String {
        return "3/movie"
    }
    var baseURL: String = Constants.baseURL
    var header: [String : String] = [:]
    var method: URLRequestMethod = .get
    var queries: [String : String] {
        return [
            "api_key": Constants.apiKey]
    }
}
