//
//  MovieListItemView.swift
//  Moviedb
//
//  Created by Negar Tolou on 25.11.22.
//

import SwiftUI

struct MovieListItemView: View {
    let movie: MovieModel
    // MARK: - Body
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            let urlImage = "https://image.tmdb.org/t/p/w500/" + (movie.posterPath ?? "")
            UrlImageView(urlString: urlImage)
            VStack(alignment: .leading, spacing: 8) {
                Text(movie.title ?? "")
                    .font(.title3)
                    .fontWeight(.heavy)
                HStack(alignment: .center, spacing: 4) {
                    Text("IMDB Rate:")
                        .font(.callout)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .padding(.trailing, 8)
                        .foregroundColor(.green)
                    Text(String(movie.voteAverage ?? 0.0))
                        .font(.callout)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .padding(.trailing, 8)
                        .foregroundColor(.green)
                }
                Text(movie.overview ?? "")
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing, 8)
                HStack(alignment: .center, spacing: 4) {
                    Text("Releas Date:")
                        .font(.footnote)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .padding(.trailing, 8)
                   Text(movie.releaseDate ?? "")
                        .font(.footnote)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .padding(.trailing, 8)
                } //: Hstack
            } //: Vstack
        } //: Vstack
    }
}

struct MovieListItemView_Previews: PreviewProvider {
    static let response: PopularMovieResponseModel = Bundle.main.decode("movies.json")
    static let movies = response.results
    static var previews: some View {
        MovieListItemView(movie: (movies?[0])!)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
