//
//  TopPlayListDTO.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 28/06/25.
//

import Foundation

struct TopPlayListDTO: Decodable {
    let data: [TopPlayListDataDTO]
}

struct TopPlayListDataDTO: Decodable {
    let id: Int?
    let title: String?
    let pictureBig: String?
    let user: TopPlayListDataUserDTO
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case pictureBig = "picture_big"
        case user
    }
}

struct TopPlayListDataUserDTO: Decodable {
    let id: Int?
    let name: String?
}
