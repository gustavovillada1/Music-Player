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
    private let networkMapper: NetworkErrorMapper
    
    init(apiManager: ApiDataManagerProtocol, dataMapper: RepositoryDataMapper, networkMapper: NetworkErrorMapper) {
        self.apiManager = apiManager
        self.dataMapper = dataMapper
        self.networkMapper = networkMapper
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
