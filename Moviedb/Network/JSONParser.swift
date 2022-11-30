//
//  JSONParser.swift
//  Moviedb
//
//  Created by Negar Tolou on 29.11.22.
//

import Foundation
protocol Parsable {
    func parse<T: Decodable>(data: Data) throws -> T
}

struct JSONParser: Parsable {
    let decoder: JSONDecoder

    init(decoder: JSONDecoder) {
        self.decoder = decoder
    }

    func parse<T: Decodable>(data: Data) throws -> T {
        return try decoder.decode(T.self, from: data)
    }
}
