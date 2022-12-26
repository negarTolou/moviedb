//
//  MovieDetailView.swift
//  Moviedb
//
//  Created by Negar Tolou on 25.11.22.
//

import SwiftUI

struct MovieDetailView: View {

    var id: String?
    @StateObject private var viewModel = MovieDetailViewModel(service: MovieListService(session: NetworkSession(), parser: JSONParser(decoder: JSONDecoder())))

    // MARK: - Body
    var body: some View {

        VStack(){

            if viewModel.movie != nil {
                UrlImageView(urlString: viewModel.imgBackgroubd, imgWidth: 600, imgHeight: 300)

                VStack(alignment: .leading, spacing: 8){
                    UrlImageView(urlString: viewModel.urlImage, imgWidth: 100, imgHeight: 100)

                    Text(viewModel.title ?? "")
                        .font(.title3)
                        .fontWeight(.heavy)

                    HStack(alignment: .center, spacing: 4) {

                        Text(viewModel.reviewCount ?? "")
                            .font(.callout)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                            .padding(.trailing, 8)
                            .foregroundColor(.green)
                    }

                    Text(viewModel.subTitle ?? "")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .padding(.trailing, 8)

                    HStack(alignment: .center, spacing: 4) {

                        Text(viewModel.releaseDate ?? "")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                            .padding(.trailing, 8)
                    }
                }
            }
            Spacer()
        }.onAppear(perform: loadData)
        .navigationTitle(viewModel.title ?? "")
    }

    private func loadData() {
        Task {
            guard let id = id else {throw UrlError.invalidComponents}
            try await viewModel.getMovieDetail(id: id)
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static let response: PopularMovieResponseModel = Bundle.main.decode("movies.json")
    static let movies = response.results
    static var previews: some View {
        let model = MovieListItemViewModel(movie: (movies?[0]))
        
        MovieDetailView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

