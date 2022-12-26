//
//  MovieItemViewTests.swift
//  MoviedbTests
//
//  Created by Negar Tolou on 20.12.22.
//

import SnapshotTesting
import XCTest
import SwiftUI

@testable import Moviedb

class MovieItemViewTests: XCTestCase {
    func testMyViewController() {

        let response: PopularMovieResponseModel = Bundle.main.decode("movies.json")
        let movies = response.results

        let vc = MovieListItemView(movie: MovieListItemViewModel(movie: movies?.first))
        assertSnapshot(matching: vc, as: .image)
    }
}
