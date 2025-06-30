//
//  MainViewModel.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 29/06/25.
//

import Foundation
import Combine

class MainViewModel: MainViewModelProtocol {
    var getTrackDetailUseCase: GetTrackDetailUseCaseProtocol
    @Published var playerManager: AudioPlayerManager = AudioPlayerManager()
    @Published var trackDetailState: ScreenState<TrackDetail> = .idle
    private var cancellables: Set<AnyCancellable> = Set<AnyCancellable>()
    
    init(getTrackDetailUseCase: GetTrackDetailUseCaseProtocol, playerManager: AudioPlayerManager) {
        self.getTrackDetailUseCase = getTrackDetailUseCase
        self.playerManager = playerManager
    }
    
    func onAppear() { }
    
    func updateTrackInfo(trackId: Int) {
        trackDetailState = .loading
        getTrackDetailUseCase.execute(trackId: trackId)
            .receive(on: DispatchSerialQueue.main)
            .sink {[weak self] response in
                switch response {
                    
                case .finished:
                    return
                case .failure(let error):
                    self?.trackDetailState = .error(error: error)
                }
            } receiveValue: { trackDetail in
                self.trackDetailState = .success(data: trackDetail)
            }
            .store(in: &cancellables)

    }
    
}
