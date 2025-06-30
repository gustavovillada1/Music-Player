//
//  TrackDetailDTO.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 29/06/25.
//

import Foundation

struct TrackDetailDTO: Decodable {
    let id: Int?
    let title: String?
    let link: String?
    let duration: Int?
    let explicitLyrics: Bool?
    let preview: String?
    let contributors: [TrackDetailContributorDTO]
    let album: TrackDetailAlbumDTO
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case link
        case duration
        case explicitLyrics = "explicit_lyrics"
        case preview
        case contributors
        case album
    }
}
/*
struct TrackDetailContributorDTO: Decodable {
    let id: Int?
    let name: String?
    let pictureBig: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case pictureBig = "picture_big"
    }
}

struct TrackDetailAlbumDTO: Decodable {
    let id: Int?
    let title: String?
    let coverBig: String?
    let releaseDate: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case coverBig = "cover_big"
        case releaseDate = "release_date"
    }
}
*/
