//
//  Track.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 25/06/25.
//

import Foundation

struct Track {
    let id: Int
    let title: String
    let link: String
    let preview: String
    let artist: TrackArtist
    let album: TrackAlbum
}
