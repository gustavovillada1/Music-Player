//
//  TopArtistsDTO.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 25/06/25.
//

import Foundation

struct TopArtistsDTO: Decodable {
    let data: [TopArtistsDataDTO]
}

struct TopArtistsDataDTO: Decodable {
    let id: Int?
    let name: String?
    let pictureBig: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case pictureBig = "picture_big"
    }
}
