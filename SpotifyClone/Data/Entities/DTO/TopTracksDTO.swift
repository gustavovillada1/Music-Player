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
    let id: String?
    let genre: String?
    let title: String?
    let artwork: TopTracksDataArtWorkDTO?
    let user: TopTracksDataArtistDTO?
}

struct TopTracksDataArtWorkDTO: Decodable {
    let smallPicture: String?
    let mediumPicture: String?
    let bigPicture: String?
    
    enum CodingKeys: String, CodingKey {
        case smallPicture = "150x150"
        case mediumPicture = "480x480"
        case bigPicture = "1000x1000"
    }
}

struct TopTracksDataArtistDTO: Decodable {
    let id: String?
    let name: String?
    let coverPhoto: TopTracksDataArtistCoverPhotoDTO?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case coverPhoto = "cover_photo"
    }
}

struct TopTracksDataArtistCoverPhotoDTO: Decodable {
    let smallPicture: String?
    let bigPicture: String?

    enum CodingKeys: String, CodingKey {
        case smallPicture = "640x"
        case bigPicture = "2000x"
    }
}

