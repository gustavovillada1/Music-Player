//
//  GetTopArtistsUseCase.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 28/06/25.
//

import Foundation
import Combine

class GetTopArtistsUseCase: GetTopArtistsUseCaseProtocol {
    private let repository: AppRepositoryProtocol
    private let domainMapper: DomainMapper
    
    init(repository: AppRepositoryProtocol, domainMapper: DomainMapper) {
        self.repository = repository
        self.domainMapper = domainMapper
    }
    
    func execute() -> AnyPublisher<[TopArtist], AppError> {
        repository.getTopArtist()
            .map(domainMapper.mapToTopArtist)
            .eraseToAnyPublisher()
    }
    
}
