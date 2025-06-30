//
//  HomeViewModelProtocol.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 25/06/25.
//

import Foundation

protocol HomeViewModelProtocol: ObservableObject {
    
    // MARK: Use cases
    var getTopTracksUseCase: GetTopTracksUseCaseProtocol { get }
    var getTopArtistsUseCase: GetTopArtistsUseCaseProtocol { get }
    var getTopPlayListsUseCase: GetTopPlayListsUseCaseProtocol { get }
    var playListIdSelected: Int { get set }
    
    // MARK: State screen
    var topTracksState: ScreenState<[TopTrack]> { get set }
    var topArtistsState: ScreenState<[TopArtist]> { get set }
    var topPlayListsState: ScreenState<[TopPlayList]> { get set }

    func onAppear()
}
