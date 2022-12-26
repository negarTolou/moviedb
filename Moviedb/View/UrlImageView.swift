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
    var width: Double
    var height: Double

    init(urlString: String?, imgWidth: Double, imgHeight: Double) {
        urlImageVM = UrlImageViewModel(urlString: urlString)
        self.width = imgWidth
        self.height = imgHeight
    }
    
    var body: some View {
        Image(uiImage: (urlImageVM.image))
            .resizable()
            .scaledToFit()
            .frame(width: width, height: height)
            .onAppear {
                Task {
                    try? await urlImageVM.loadImage()
                }
            }
    }

}

struct UrlImageView_Previews: PreviewProvider {
    static var previews: some View {
        UrlImageView(urlString: nil, imgWidth: 300, imgHeight: 300)
    }
}

