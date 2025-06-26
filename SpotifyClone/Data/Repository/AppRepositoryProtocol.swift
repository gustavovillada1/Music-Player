//
//  AppRepositoryProtocol.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 25/06/25.
//

import Foundation
import Combine

protocol AppRepositoryProtocol {
    func getTopArtist() -> AnyPublisher<TopArtistsDTO, AppError>
    func getTopTracks() -> AnyPublisher<[TopTracksDomain], AppError>
}
