//
//  TopTracksDTO.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 25/06/25.
//

import Foundation

struct TopTracksDTO: Decodable {
    let data: [TopTracksDataDTO]
}

struct TopTracksDataDTO: Decodable {
    let id: Int?
    let title: String?
    let preview: String?
    let artist: TopTracksDataArtistDTO
    let album: TopTrackDataAlbumDTO
}

struct TopTracksDataArtistDTO: Decodable {
    let name: String?
}

struct TopTrackDataAlbumDTO: Decodable {
    let bigCover: String?
    enum CodingKeys: String, CodingKey {
        case bigCover = "cover_big"
    }
}
