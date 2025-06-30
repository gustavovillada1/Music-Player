//
//  GetPlayListDetailUseCase.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 29/06/25.
//

import Foundation
import Combine

class GetPlayListDetailUseCase: GetPlayListDetailUseCaseProtocol {
    private let repository: AppRepositoryProtocol
    private let domainMapper: DomainMapper
    
    init(repository: AppRepositoryProtocol, domainMapper: DomainMapper) {
        self.repository = repository
        self.domainMapper = domainMapper
    }
    
    func execute(playListId: Int) -> AnyPublisher<PlayListDetail, AppError> {
        repository.getPlayListDetail(playListId: playListId)
            .map(domainMapper.mapToPlayListDetailDomain)
            .eraseToAnyPublisher()
    }
}
