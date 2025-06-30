//
//  PlayListViewModel.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 29/06/25.
//

import Foundation
import Combine

class PlayListViewModel: PlayListViewModelProtocol {
    @Published var playListState: ScreenState<PlayListDetail> = .loading
    
    var getPlayLisDetailtUseCase: GetPlayListDetailUseCaseProtocol
    private let playListId: Int

    private var cancellables: Set<AnyCancellable> = Set<AnyCancellable>()
    
    init(getPlayLisDetailtUseCase: GetPlayListDetailUseCaseProtocol, playListId: Int) {
        self.getPlayLisDetailtUseCase = getPlayLisDetailtUseCase
        self.playListId = playListId
    }
    
    func callGetPlayLisDetailUseCase() {
        getPlayLisDetailtUseCase.execute(playListId: playListId)
            .receive(on: DispatchQueue.main)
            .sink {[weak self] response in
                switch response {
                    
                case .finished:
                    return
                case .failure(let error):
                    self?.playListState = .error(error: error)
                }
            } receiveValue: { playListDetail in
                self.playListState = .success(data: playListDetail)
            }
            .store(in: &cancellables)

    }
    
}
