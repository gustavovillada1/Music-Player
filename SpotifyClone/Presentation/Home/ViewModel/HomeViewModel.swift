//
//  HomeViewModel.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 25/06/25.
//

import Foundation
import Combine

class HomeViewModel: HomeViewModelProtocol {
    
    @Published var topTracksState: ScreenState<[TopTrack]> = .idle
    @Published var topArtistsState: ScreenState<[TopArtist]> = .idle
    @Published var topPlayListsState: ScreenState<[TopPlayList]> = .idle

    private var cancellables: Set<AnyCancellable> = Set<AnyCancellable>()
    var getTopTracksUseCase: GetTopTracksUseCaseProtocol
    var getTopArtistsUseCase: GetTopArtistsUseCaseProtocol
    var getTopPlayListsUseCase: GetTopPlayListsUseCaseProtocol
    var playListIdSelected: Int = 0

    init(
        getTopTracksUseCase: GetTopTracksUseCaseProtocol,
        getTopArtistsUseCase: GetTopArtistsUseCaseProtocol,
        getTopPlayListsUseCase: GetTopPlayListsUseCaseProtocol
    ) {
        self.getTopTracksUseCase = getTopTracksUseCase
        self.getTopArtistsUseCase = getTopArtistsUseCase
        self.getTopPlayListsUseCase = getTopPlayListsUseCase
    }
    
    func onAppear() {
        callTopTracksUseCase()
        callTopArtistsUseCase()
        callTopPlayListsUseCase()
    }
    
    private func callTopTracksUseCase() {
        getTopTracksUseCase.execute()
            .receive(on: DispatchSerialQueue.main)
            .sink {[weak self] response in
                switch response {
                    
                case .finished:
                    return
                case .failure(let error):
                    self?.topTracksState = .error(error: error)
                }
            } receiveValue: { topTracks in
                self.topTracksState = topTracks.isEmpty ? .empty : .success(data: topTracks)
            }
            .store(in: &cancellables)
    }
    
    private func callTopArtistsUseCase() {
        getTopArtistsUseCase.execute()
            .receive(on: DispatchSerialQueue.main)
            .sink {[weak self] response in
                switch response {
                    
                case .finished:
                    return
                case .failure(let error):
                    self?.topArtistsState = .error(error: error)
                }
            } receiveValue: { topArtists in
                self.topArtistsState = topArtists.isEmpty ? .empty : .success(data: topArtists)
            }
            .store(in: &cancellables)
    }
    
    private func callTopPlayListsUseCase() {
        getTopPlayListsUseCase.execute()
            .receive(on: DispatchSerialQueue.main)
            .sink {[weak self] response in
                switch response {
                    
                case .finished:
                    return
                case .failure(let error):
                    self?.topPlayListsState = .error(error: error)
                }
            } receiveValue: { topPlayLists in
                self.topPlayListsState = topPlayLists.isEmpty ? .empty : .success(data: topPlayLists)
            }
            .store(in: &cancellables)
    }
}
