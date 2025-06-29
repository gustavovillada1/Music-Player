//
//  ApiDataManagerProtocol.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 25/06/25.
//

import Foundation
import Combine

protocol ApiDataManagerProtocol {
    func getTopArtist() -> AnyPublisher<TopArtistsDTO, AppError>
    
    func getTopTracks() -> AnyPublisher<TopTracksDTO, AppError>
}
