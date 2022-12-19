//
//  MovieDetailViewModel.swift
//  Moviedb
//
//  Created by Negar Tolou on 15.12.22.
//

import Foundation

@MainActor class MovieDetailViewModel: ObservableObject, Identifiable {
    
    private let service: MovieListService?
    @Published var movie: MovieDetailModel?

    var imgBackgroubd: String?
    var urlImage: String?
    var title: String?
    var subTitle: String?
    var reviewCount: String?
    var releaseDate: String?

    init(service: MovieListService) {
        self.service = service
    }
    
    func getMovieDetail(id: String) async throws -> MovieDetailModel?{
        do {
         
            let result = try? await service?.getMovieDetail(api: MovieDetailAPI(id: id))
            if let data = result {
                self.movie = data
                setData(movie: self.movie!)
                return self.movie
            }
        } catch let error {
            throw error
        }
        return nil
    }

    private func setData(movie: MovieDetailModel){
        self.urlImage = "https://image.tmdb.org/t/p/w500/" + (movie.posterPath ?? "")
        self.imgBackgroubd = "https://image.tmdb.org/t/p/w500/" + (movie.backdropPath ?? "")
        self.title = movie.title
        self.subTitle = movie.overview
        self.reviewCount = "IMDB Rate: " + (String(movie.voteAverage ?? 0.0))
        self.releaseDate = "Releas Date: " + (movie.releaseDate ?? "")
    }
}
