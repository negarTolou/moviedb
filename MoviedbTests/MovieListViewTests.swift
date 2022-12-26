//
//  MovieListViewTests.swift
//  MoviedbTests
//
//  Created by Negar Tolou on 20.12.22.
//

import Foundation
import SnapshotTesting
import XCTest
import SwiftUI

@testable import Moviedb

class MovieListViewTests: XCTestCase {
    func testMyViewController() {
        let vc = MoviesListView()

        assertSnapshot(matching: vc, as: .image)
    }
}
