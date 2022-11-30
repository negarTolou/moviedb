//
//  UrlImageView.swift
//  Moviedb
//
//  Created by Negar Tolou on 25.11.22.
//

import Foundation
import SwiftUI

struct UrlImageView: View {
    @ObservedObject var urlImageVM: UrlImageViewModel

    @State var image: UIImage!
    var defaultImage = UIImage(named: "logo")
    
    init(urlString: String?) {
        urlImageVM = UrlImageViewModel(urlString: urlString)
    }
    
    var body: some View {
        Image(uiImage: image ?? defaultImage!)
            .resizable()
            .scaledToFit()
            .frame(width: 300, height: 300)
            .onAppear {
               loadImage()
            }
    }
    
    func loadImage() {
        Task {
            let asyncIMage = try? await urlImageVM.getImage()
            DispatchQueue.main.async {
                image = asyncIMage
            }
        }
    }
}

struct UrlImageView_Previews: PreviewProvider {
    static var previews: some View {
        UrlImageView(urlString: nil)
    }
}
