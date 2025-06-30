//
//  PlayListDetailDomain.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 29/06/25.
//

import Foundation

struct PlayListDetailDomain {
    let id: Int
    let title: String
    let description: String
    let duration: Int
    let fans: Int
    let pictureBig: String
    let creationDate: String
    let creator: PlayListDetailCreatorDomain
    let tracks: [TopTracksDomain]
}

struct PlayListDetailCreatorDomain {
    let id: Int
    let name: String
}
