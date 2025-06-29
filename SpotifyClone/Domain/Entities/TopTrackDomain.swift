//
//  TopTracksDomain.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 25/06/25.
//

import Foundation

struct TopTracksDomain {
    let id: String
    let title: String
    let link: String
    let preview: String
    let artist: TopTracksDataArtistDomain
    let album: TopTrackDataAlbumDomain
}

struct TopTracksDataArtistDomain {
    let id: String
    let name: String
    let picture: String
}

struct TopTrackDataAlbumDomain {
    let id: String
    let title: String
    let cover: String
}
