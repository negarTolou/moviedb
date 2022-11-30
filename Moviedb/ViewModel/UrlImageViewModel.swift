//
//  UrlImageModel.swift
//  Moviedb
//
//  Created by Negar Tolou on 25.11.22.
//

import Foundation
import SwiftUI

final class UrlImageViewModel: ObservableObject {
    var urlString: String?
    var imageCache = ImageCache.getImageCache()
    init(urlString: String?) {
        self.urlString = urlString
    }
    func getImage() async throws -> UIImage {
        guard let urlString = urlString else {throw UrlError.invalidURL}
        let cacheImage = imageCache.get(forKey: urlString)
        if cacheImage == nil {
            return try await loadImageFromUrl()
        } else {
            return cacheImage!
        }
    }
    func loadImageFromUrl() async throws -> UIImage {
        guard let urlString = urlString else {throw UrlError.invalidURL}
        let url = URL(string: urlString)!

        let (data, _) = try await URLSession.shared.data(from: url)
        return try await getImageFromResponse(data: data)
    }
    func getImageFromResponse(data: Data?) async throws -> UIImage {
        guard let data = data else {throw UrlError.invalidURL}
            guard let loadedImage = UIImage(data: data) else {
                throw UrlError.invalidURL
            }
            guard let url = self.urlString else {throw UrlError.invalidURL}
            self.imageCache.set(forKey: url, image: loadedImage)
            return loadedImage
    }
}
