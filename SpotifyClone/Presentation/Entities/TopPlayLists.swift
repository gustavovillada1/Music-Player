//
//  TopPlayLists.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 29/06/25.
//

import Foundation


struct TopPlayList {
    let id: Int
    let title: String
    let pictureBig: String
    let user: TopPlayListUser
}

struct TopPlayListUser {
    let id: Int
    let name: String
}
