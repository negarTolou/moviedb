//
//  URLImageViewTests.swift
//  MoviedbTests
//
//  Created by Negar Tolou on 20.12.22.
//

import SnapshotTesting
import XCTest
import SwiftUI

@testable import Moviedb

class URLImageViewTests: XCTestCase {
    func testMyViewController() {
        let urlImg = "https://image.tmdb.org/t/p/w500/pFlaoHTZeyNkG83vxsAJiGzfSsa.jpg"
        let vc = UrlImageView(urlString: urlImg, imgWidth: 300, imgHeight: 300)

        assertSnapshot(matching: vc, as: .image)
    }
}
