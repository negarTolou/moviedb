//
//  MoviesListView.swift
//  Moviedb
//
//  Created by Negar Tolou on 25.11.22.
//

import SwiftUI
import Foundation

struct MoviesListView: View {
    @State private var movies: [MovieListItemViewModel]?
    @StateObject var viewModel = MovieListViewModel(service: MovieListService(session: NetworkSession(), parser: JSONParser(decoder: JSONDecoder())))
    
    var body: some View {
        // MARK: - BODY
        NavigationStack {

            List {
                if movies != nil {
                    ForEach(movies!) { movie in

                        MovieListItemView(movie: movie)

                        let id = String(movie.id ?? 0)
                        NavigationLink(destination: MovieDetailView(id: id))
                        {
                            Image(systemName: "info.bubble.fill")
                            Text("Get More Detail")
                        }
                    }
                }
            }
            .navigationTitle("Movie List")
        }.onAppear(perform: loadData) //: Navigation
    }
    private func loadData() {
        Task {
            movies = try await viewModel.getMovieList()
        }
    }
}

struct MoviesListView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesListView()
    }
}
