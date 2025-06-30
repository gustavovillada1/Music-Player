//
//  GetTopTracksUseCase.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 25/06/25.
//

import Foundation
import Combine

class GetTopTracksUseCase: GetTopTracksUseCaseProtocol {
    private let repository: AppRepositoryProtocol
    private let domainMapper: DomainMapper
    
    init(repository: AppRepositoryProtocol, domainMapper: DomainMapper) {
        self.repository = repository
        self.domainMapper = domainMapper
    }
    
    func execute() -> AnyPublisher<[TopTrack], AppError> {
        repository.getTopTracks()
            .map(domainMapper.mapTopTracks)
            .eraseToAnyPublisher()
    }
}
