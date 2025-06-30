//
//  TopPlayListsDomain.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 29/06/25.
//

import Foundation

struct TopPlayListDomain {
    let id: Int
    let title: String
    let pictureBig: String
    let user: TopPlayListUserDomain
}

struct TopPlayListUserDomain {
    let id: Int
    let name: String
}
