//
//  MovieListItemView.swift
//  Moviedb
//
//  Created by Negar Tolou on 25.11.22.
//

import SwiftUI

struct MovieListItemView: View {
    let movie: MovieListItemViewModel
    // MARK: - Body
    var body: some View {

            VStack(alignment: .center, spacing: 16) {

                UrlImageView(urlString: movie.urlImage, imgWidth: 300, imgHeight: 300)

                VStack(alignment: .leading, spacing: 8) {
                    Text(movie.title)
                        .font(.title3)
                        .fontWeight(.heavy)

                    HStack(alignment: .center, spacing: 4) {

                        Text(movie.reviewCount)
                            .font(.callout)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                            .padding(.trailing, 8)
                            .foregroundColor(.green)
                    }

                    Text(movie.subTitle)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .padding(.trailing, 8)

                    HStack(alignment: .center, spacing: 4) {

                        Text(movie.releaseDate)
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
        let model = MovieListItemViewModel(movie: (movies?[0]))
        
        MovieListItemView(movie: model)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

