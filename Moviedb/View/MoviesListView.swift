//
//  MoviesListView.swift
//  Moviedb
//
//  Created by Negar Tolou on 25.11.22.
//

import SwiftUI
import Foundation

struct MoviesListView: View {
    
    @State private var movies : [MovieModel]?
    @StateObject var viewModel = MovieListViewModel()
    
    var body: some View  {
        
        //MARK: - BODY
        NavigationView{
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
        
    
    func loadData(){
        Task {
            movies = await viewModel.getPopularMovies()
        }
    }
}

struct MoviesListView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesListView()
    }
}

