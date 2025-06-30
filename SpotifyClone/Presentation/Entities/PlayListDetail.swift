//
//  PlayListDetail.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 29/06/25.
//

import Foundation

struct PlayListDetail {
    let id: Int
    let title: String
    let description: String
    let duration: Int
    let fans: Int
    let pictureBig: String
    let creationDate: String
    let creator: PlayListDetailCreator
    let tracks: [TopTrack]
}

struct PlayListDetailCreator {
    let id: Int
    let name: String
}
