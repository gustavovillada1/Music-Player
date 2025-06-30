//
//  TrackDetail.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 29/06/25.
//

import Foundation

struct TrackDetail {
    let id: Int
    let title: String
    let link: String
    let duration: Int
    let explicitLyrics: Bool
    let preview: String
    let contributors: [TrackDetailContributor]
    let album: TrackDetailAlbum
}

struct TrackDetailContributor {
    let id: Int
    let name: String
    let pictureBig: String
}

struct TrackDetailAlbum {
    let id: Int
    let title: String
    let coverBig: String
    let releaseDate: String
}
