//
//  MoviesListViewModel.swift
//  Moviedb
//
//  Created by Negar Tolou on 25.11.22.
//

import Foundation

final class MovieListViewModel: ObservableObject {
    @Published var movies: [MovieModel]?
    @MainActor
    func getPopularMovies() async -> [MovieModel] {
        movies = await asyncCall()
        return movies!
    }
    func asyncCall() async -> [MovieModel] {
        // todo: make constant file for statics
        let apiKey = "db19d1f9fd84d47d6e26e13d2d97e21a"
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)") else {fatalError("Missing URL")}
            let urlRequest = URLRequest(url: url)
            do {
                let (data, response) = try await URLSession.shared.data(for: urlRequest)

                if let movieResponse = self.parseJSON(data) {
                    return movieResponse.results ?? []
                }
            } catch let error {
                // todo: handle log
                print("Catch Error: ", error)
            }
        return []
    }
    // todo: make as single responsible in another class
    func parseJSON(_ movie: Data) -> PopularMovieResponseModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(PopularMovieResponseModel.self, from: movie)
            let movieResponse = decodedData
            return movieResponse
        } catch let error {
            if let decodingError = error as? DecodingError {
                // todo: handle log
                print("Error decoding: ", decodingError)
            }
            return nil
        }
    }
}
