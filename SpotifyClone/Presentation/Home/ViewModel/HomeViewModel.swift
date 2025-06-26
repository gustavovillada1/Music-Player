//
//  HomeViewModel.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 25/06/25.
//

import Foundation
import Combine

class HomeViewModel: HomeViewModelProtocol {
    
    @Published var topTracks: [Track] = []
    @Published var isLoadingTopTracks: Bool = true


    private var cancellables: Set<AnyCancellable> = Set<AnyCancellable>()
    var getTopTracksUseCase: GetTopTracksUseCaseProtocol
    
    init(getTopTracksUseCase: GetTopTracksUseCaseProtocol) {
        self.getTopTracksUseCase = getTopTracksUseCase
    }
    
    func onAppear() {
        getTopTracksUseCase.execute()
            .receive(on: DispatchSerialQueue.main)
            .sink {[weak self] response in
                switch response {
                    
                case .finished:
                    self?.isLoadingTopTracks = false
                case .failure(_):
                    self?.isLoadingTopTracks = false
                }
            } receiveValue: { topTracks in
                self.topTracks = topTracks
            }
            .store(in: &cancellables)

    }
    
}
