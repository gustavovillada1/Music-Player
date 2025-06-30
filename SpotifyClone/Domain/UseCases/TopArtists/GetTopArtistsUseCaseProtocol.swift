//
//  GetTopArtistsUseCaseProtocol.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 28/06/25.
//

import Foundation
import Combine

protocol GetTopArtistsUseCaseProtocol {
    func execute() -> AnyPublisher<[TopArtist], AppError>
}
