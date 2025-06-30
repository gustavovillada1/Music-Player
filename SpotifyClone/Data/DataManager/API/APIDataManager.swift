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
    
    private let topTracksEndpoint = "/chart/0/tracks"
    private let topArtistsEndpoint = "/chart/0/artists"
    private let topPlayListsEndpoint = "/chart/0/playlists"
    private let trackDetailEndpoint = "/track/"
    private let playListDetailEndpoint = "/playlist/"


    init(networkClient: NetworkClientProtocol) {
        self.networkClient = networkClient
    }
    
    func getTopArtist() -> AnyPublisher<TopArtistsDTO, AppError> {
        return networkClient.performRequest(
            endpoint: topArtistsEndpoint,
            method: "GET",
            queryItems: nil,
            headers: nil
        )
    }
    
    func getTopTracks() -> AnyPublisher<TopTracksDTO, AppError> {
        return networkClient.performRequest(
            endpoint: topTracksEndpoint,
            method: "GET",
            queryItems: nil,
            headers: nil
        )
    }
    
    func getTopPlayLists() -> AnyPublisher<TopPlayListDTO, AppError> {
        return networkClient.performRequest(
            endpoint: topPlayListsEndpoint, 
            method: "GET",
            queryItems: nil,
            headers: nil
        )
    }
    
    func getTrackDetail(trackId: Int) -> AnyPublisher<TrackDetailDTO, AppError> {
        let finalEndpoint = "\(trackDetailEndpoint)\(trackId)"
        return networkClient.performRequest(
            endpoint: finalEndpoint,
            method: "GET",
            queryItems: nil,
            headers: nil
        )
    }
    
    func getPlayListDetail(playListId: Int) -> AnyPublisher<PlayListDetailDTO, AppError> {
        let finalEndpoint = "\(playListDetailEndpoint)\(playListId)"
        return networkClient.performRequest(
            endpoint: finalEndpoint,
            method: "GET",
            queryItems: nil,
            headers: nil
        )
    }
}
