//
//  MovieListItemViewModel.swift
//  Moviedb
//
//  Created by Negar Tolou on 30.11.22.
//

import Foundation
final class MovieListItemViewModel: ObservableObject, Identifiable {
    @Published var movie: MovieModel?
    
    var id: Int?
    let urlImage: String
    let title: String
    let subTitle: String
    let reviewCount: String
    let releaseDate: String
    
    init(movie: MovieModel?) {
        self.movie = movie
        self.id = movie?.id
        self.urlImage = "https://image.tmdb.org/t/p/w500/" + (movie?.posterPath ?? "")
        self.title = movie?.title ?? ""
        self.subTitle = movie?.overview ?? ""
        self.reviewCount = "IMDB Rate: " + (String(movie?.voteAverage ?? 0.0))
        self.releaseDate = "Releas Date: " + (movie?.releaseDate ?? "")
    }
}
