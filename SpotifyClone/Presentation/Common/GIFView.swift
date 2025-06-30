//
//  GIFView.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 29/06/25.
//

import Foundation
import SwiftUI
import UIKit

struct GIFView: UIViewRepresentable {
    let name: String

    func makeUIView(context: Context) -> UIImageView {
        let imageView = UIImageView()
        if let path = Bundle.main.path(forResource: name, ofType: "gif"),
           let data = NSData(contentsOfFile: path),
           let source = CGImageSourceCreateWithData(data, nil),
           let animated = UIImage.animatedImageWithSource(source) {
            imageView.image = animated
        }
        return imageView
    }

    func updateUIView(_ uiView: UIImageView, context: Context) {}
}
