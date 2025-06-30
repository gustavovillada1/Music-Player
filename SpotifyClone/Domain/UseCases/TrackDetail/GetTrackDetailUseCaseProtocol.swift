//
//  GetTrackDetailUseCaseProtocol.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 29/06/25.
//

import Foundation
import Combine

protocol GetTrackDetailUseCaseProtocol {
    func execute(trackId: Int) -> AnyPublisher<TrackDetail, AppError>
}
