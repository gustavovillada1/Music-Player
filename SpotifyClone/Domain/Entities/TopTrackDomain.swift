//
//  TopTracksDomain.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 25/06/25.
//

import Foundation

struct TopTracksDomain {
    let id: Int
    let title: String
    let preview: String
    let artist: TopTracksDataArtistDomain
    let album: TopTrackDataAlbumDomain
}

struct TopTracksDataArtistDomain {
    let name: String
}

struct TopTrackDataAlbumDomain {
    let cover: String
}
