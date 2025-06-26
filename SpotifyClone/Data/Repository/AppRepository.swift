//
//  AppRepository.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 25/06/25.
//

import Foundation
import Combine

class AppRepository: AppRepositoryProtocol {
    private let apiManager: ApiDataManagerProtocol
    private let dataMapper: RepositoryDataMapper
    
    init(apiManager: ApiDataManagerProtocol, dataMapper: RepositoryDataMapper) {
        self.apiManager = apiManager
        self.dataMapper = dataMapper
    }
    
    func getTopArtist() -> AnyPublisher<TopArtistsDTO, AppError> {
        apiManager.getTopArtist()
    }
    
    func getTopTracks() -> AnyPublisher<[TopTracksDomain], AppError> {
        apiManager.getTopTracks()
            .map(dataMapper.mapTopTracksDomain)
            .eraseToAnyPublisher()
    }
}
