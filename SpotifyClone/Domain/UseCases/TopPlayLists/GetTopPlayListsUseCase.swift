//
//  GetTopPlayListsUseCase.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 29/06/25.
//

import Foundation
import Combine

class GetTopPlayListsUseCase: GetTopPlayListsUseCaseProtocol {
    private let repository: AppRepositoryProtocol
    private let domainMapper: DomainMapper
    
    init(repository: AppRepositoryProtocol, domainMapper: DomainMapper) {
        self.repository = repository
        self.domainMapper = domainMapper
    }
    
    func execute() -> AnyPublisher<[TopPlayList], AppError> {
        repository.getTopPlayLists()
            .map(domainMapper.mapToTopPlaylists)
            .eraseToAnyPublisher()
    }
}
