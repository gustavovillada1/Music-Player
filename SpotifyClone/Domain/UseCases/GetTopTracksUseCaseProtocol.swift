//
//  GetTopTracksUseCaseProtocol.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 25/06/25.
//

import Foundation
import Combine

protocol GetTopTracksUseCaseProtocol {
    func execute() -> AnyPublisher<[Track], AppError>
}
