//
//  TrackDetailDomain.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 29/06/25.
//

import Foundation

struct TrackDetailDomain {
    let id: Int
    let title: String
    let link: String
    let duration: Int
    let explicitLyrics: Bool
    let preview: String
    let contributors: [TrackDetailContributorDomain]
    let album: TrackDetailAlbumDomain
}

struct TrackDetailContributorDomain {
    let id: Int
    let name: String
    let pictureBig: String
}

struct TrackDetailAlbumDomain {
    let id: Int
    let title: String
    let coverBig: String
    let releaseDate: String
}

