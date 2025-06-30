//
//  GetTrackDetailUseCase.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 29/06/25.
//

import Foundation
import Combine

class GetTrackDetailUseCase: GetTrackDetailUseCaseProtocol {
    private let repository: AppRepositoryProtocol
    private let domainMapper: DomainMapper
    
    init(repository: AppRepositoryProtocol, domainMapper: DomainMapper) {
        self.repository = repository
        self.domainMapper = domainMapper
    }
    
    func execute(trackId: Int) -> AnyPublisher<TrackDetail, AppError> {
        repository.getTrackDetail(trackId: trackId)
            .map(domainMapper.mapToTrackDetail)
            .eraseToAnyPublisher()
    }
}
