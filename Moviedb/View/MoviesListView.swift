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
        NavigationView {
            List {
                if movies != nil {
                    ForEach(movies!) { movie in
                        //                    NavigationLink(destination: MovieDetailView(movie: movie)){
                        MovieListItemView(movie: movie)
                        //                    } //: NavigationLink
                    } //: loop
                }
            } //: List
            .navigationBarTitle("Movie List", displayMode: .large)
        }.onAppear(perform: loadData) //: Navigation
    }
    private func loadData() {
        Task {
            movies = await viewModel.getMovieList()
        }
    }
}

struct MoviesListView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesListView()
    }
}
