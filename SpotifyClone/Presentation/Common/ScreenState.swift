//
//  ScreenState.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 28/06/25.
//

import Foundation

enum ScreenState<T> {
    case idle
    case loading
    case empty
    case error(error: AppError)
    case success(data: T)
}
