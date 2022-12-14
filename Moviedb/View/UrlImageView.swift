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
    
    init(urlString: String?) {
        urlImageVM = UrlImageViewModel(urlString: urlString)
    }
    
    var body: some View {
        Image(uiImage: urlImageVM.image)
            .resizable()
            .scaledToFit()
            .frame(width: 300, height: 300)
            .onAppear {
                DispatchQueue.main.async {
                    urlImageVM.loadImage()
                }
            }
    }
}

struct UrlImageView_Previews: PreviewProvider {
    static var previews: some View {
        UrlImageView(urlString: nil)
    }
}

