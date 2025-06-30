//
//  TrackDetailAlbumDTO.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 29/06/25.
//

import Foundation

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
