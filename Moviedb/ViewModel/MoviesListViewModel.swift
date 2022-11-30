//
//  MoviesListViewModel.swift
//  Moviedb
//
//  Created by Negar Tolou on 25.11.22.
//

import Foundation

final class MovieListViewModel: ObservableObject {
    
    private let service: MovieListService?
    
    init(service: MovieListService) {
        self.service = service
    }
    
    func getMovieList() async -> [MovieListItemViewModel] {
        do {
            let result = try? await service?.fetch(api: MovieListAPI())
            if let data = result {
                return (data.results ?? []).map {
                    MovieListItemViewModel(movie: $0)
                }
            }
        } catch let error {
            print(error)
        }
        
        return []
    }
}
