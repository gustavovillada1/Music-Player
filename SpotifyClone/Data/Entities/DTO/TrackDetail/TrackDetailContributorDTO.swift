//
//  TrackDetailContributorDTO.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 29/06/25.
//

import Foundation

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
