//
//  AppRepositoryProtocol.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 25/06/25.
//

import Foundation
import Combine

protocol AppRepositoryProtocol {
    func getTopArtist() -> AnyPublisher<[TopArtistsDomain], AppError>
    func getTopTracks() -> AnyPublisher<[TopTracksDomain], AppError>
    func getTopPlayLists() -> AnyPublisher<[TopPlayListDomain],AppError>
    func getTrackDetail(trackId: Int) -> AnyPublisher<TrackDetailDomain, AppError>
    func getPlayListDetail(playListId: Int) -> AnyPublisher<PlayListDetailDomain, AppError>
}
