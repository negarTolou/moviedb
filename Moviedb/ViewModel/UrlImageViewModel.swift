//
//  UrlImageModel.swift
//  Moviedb
//
//  Created by Negar Tolou on 25.11.22.
//

import Foundation
import SwiftUI

final class UrlImageViewModel: ObservableObject {
    @Published var image: UIImage?
    var urlString: String?
    var imageCache = ImageCache.getImageCache()
    init(urlString: String?) {
        self.urlString = urlString
        loadImage()
    }
    func loadImage() {
        if loadImageFromCache() {
            return
        }
        loadImageFromUrl()
    }
    func loadImageFromCache() -> Bool {
        guard let urlString = urlString else {
            return false
        }
        guard let cacheImage = imageCache.get(forKey: urlString) else {
            return false
        }
        image = cacheImage
        return true
    }
    func loadImageFromUrl() {
        guard let urlString = urlString else {
            return
        }
        let url = URL(string: urlString)!
        let task = URLSession.shared.dataTask(with: url, completionHandler: getImageFromResponse(data:response:error:))
        task.resume()
    }
    func getImageFromResponse(data: Data?, response: URLResponse?, error: Error?) {
        guard error == nil else {return}
        guard let data = data else {return}
        DispatchQueue.main.async {
            guard let loadedImage = UIImage(data: data) else {
                return
            }
            self.imageCache.set(forKey: self.urlString!, image: loadedImage)
            self.image = loadedImage
        }
    }
}
