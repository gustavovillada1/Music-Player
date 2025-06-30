//
//  ApiDataManagerProtocol.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 25/06/25.
//

import Foundation
import Combine

protocol ApiDataManagerProtocol {
    func getTopArtist() -> AnyPublisher<TopArtistsDTO, AppError>
    func getTopTracks() -> AnyPublisher<TopTracksDTO, AppError>
    func getTopPlayLists() -> AnyPublisher<TopPlayListDTO, AppError>
    func getTrackDetail(trackId: Int) -> AnyPublisher<TrackDetailDTO, AppError>
    func getPlayListDetail(playListId: Int) -> AnyPublisher<PlayListDetailDTO, AppError>
}
