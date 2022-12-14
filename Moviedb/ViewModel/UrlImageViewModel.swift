//
//  UrlImageModel.swift
//  Moviedb
//
//  Created by Negar Tolou on 25.11.22.
//

import Foundation
import SwiftUI

@MainActor class UrlImageViewModel: ObservableObject {
    
    private var urlString: String?
    private var imageCache: ImageCache? = ImageCache()
    @Published var image: UIImage!
    var defaultImage = UIImage(named: "logo")
    
    init(urlString: String?) {
        self.urlString = urlString
        self.image = defaultImage
    }
    
    func getImage() async throws -> UIImage {
        
        guard let urlString = urlString else {throw UrlError.invalidURL}
        
        let cacheImage = imageCache?.get(forKey: urlString)
        
        if let cacheImage = cacheImage {
            return cacheImage
        } else {
            return try await loadImageFromUrl()
        }
        
        
        
    }
    
    private func loadImageFromUrl() async throws -> UIImage {
        guard let urlString = urlString else {throw UrlError.invalidURL}
        let url = URL(string: urlString)!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        return try await getImageFromResponse(data: data)
    }
    
    private func getImageFromResponse(data: Data?) async throws -> UIImage {
        
        guard let data = data else { throw UrlError.invalidData }
        guard let loadedImage = UIImage(data: data) else { throw UrlError.invalidURL }
        guard let url = self.urlString else { throw UrlError.invalidURL }
        
        self.imageCache?.set(forKey: url, image: loadedImage)
        
        return loadedImage
    }
    
    func loadImage() {
        Task {
            let asyncImage = try? await getImage()
            image = asyncImage
        }
    }
}

