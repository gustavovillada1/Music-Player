//
//  APIDataManager.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 25/06/25.
//

import Foundation
import Combine

class APIDataManager: ApiDataManagerProtocol {

    private let networkClient: NetworkClientProtocol
    
    private let topTracksPath = "/tracks/trending"
    private let topArtistsPath = "/chart/0/artists"


    init(networkClient: NetworkClientProtocol) {
        self.networkClient = networkClient
    }
    
    func getTopArtist() -> AnyPublisher<TopArtistsDTO, AppError> {
        return networkClient.performRequest(
            endpoint: topArtistsPath,
            method: "GET",
            queryItems: nil,
            headers: nil
        )
    }
    
    func getTopTracks() -> AnyPublisher<TopTracksDTO, AppError> {
        return networkClient.performRequest(
            endpoint: topTracksPath,
            method: "GET",
            queryItems: nil,
            headers: nil
        )
    }
}
