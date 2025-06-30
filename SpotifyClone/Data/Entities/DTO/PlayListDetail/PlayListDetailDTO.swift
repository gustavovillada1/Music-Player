//
//  PlayListDetailDTO.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 29/06/25.
//

import Foundation

struct PlayListDetailDTO: Decodable {
    let id: Int?
    let title: String?
    let description: String?
    let duration: Int?
    let fans: Int?
    let pictureBig: String?
    let creationDate: String?
    let creator: PlayListDetailCreatorDTO
    let tracks: TopTracksDTO
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case duration
        case fans
        case pictureBig = "picture_big"
        case creationDate = "creation_date"
        case creator
        case tracks
    }
}

struct PlayListDetailCreatorDTO: Decodable {
    let id: Int?
    let name: String?
}
