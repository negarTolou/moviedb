//
//  MoviesListViewModel.swift
//  Moviedb
//
//  Created by Negar Tolou on 25.11.22.
//

import Foundation

final class MovieListViewModel: ObservableObject {
    let service: MovieListService?
    
    init(service: MovieListService) {
        self.service = service
    }
    
    @Published var movies: [MovieModel]?
    func getMovieList() async -> [MovieModel] {
        do {
            let result = try? await service?.fetch(api: MovieListAPI())
            if let data = result {
                return data.results ?? []
            }
        } catch let error {
            print(error)
        }
        return []
    }
}
