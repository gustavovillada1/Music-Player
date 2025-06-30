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
    private let dataMapper: DataMapper
    private let networkMapper: NetworkErrorMapper
    
    init(apiManager: ApiDataManagerProtocol, dataMapper: DataMapper, networkMapper: NetworkErrorMapper) {
        self.apiManager = apiManager
        self.dataMapper = dataMapper
        self.networkMapper = networkMapper
    }
    
    func getTopArtist() -> AnyPublisher<[TopArtistsDomain], AppError> {
        apiManager.getTopArtist()
            .map(dataMapper.mapToTopArtistsDomain)
            .eraseToAnyPublisher()
    }
    
    func getTopTracks() -> AnyPublisher<[TopTracksDomain], AppError> {
        apiManager.getTopTracks()
            .map(dataMapper.mapTopTracksDomain)
            .eraseToAnyPublisher()
    }
    
    func getTopPlayLists() -> AnyPublisher<[TopPlayListDomain], AppError> {
        apiManager.getTopPlayLists()
            .map(dataMapper.mapToTopPlayListsDomain)
            .eraseToAnyPublisher()
    }
    
    func getTrackDetail(trackId: Int) -> AnyPublisher<TrackDetailDomain, AppError> {
        apiManager.getTrackDetail(trackId: trackId)
            .map(dataMapper.mapToTrackDetailDomain)
            .eraseToAnyPublisher()
    }
    
    func getPlayListDetail(playListId: Int) -> AnyPublisher<PlayListDetailDomain, AppError> {
        apiManager.getPlayListDetail(playListId: playListId)
            .map(dataMapper.mapToPlayListDetailDomain)
            .eraseToAnyPublisher()
    }
}
