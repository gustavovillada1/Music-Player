//
//  MainViewModelProtocol.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 29/06/25.
//

import Foundation

protocol MainViewModelProtocol: ObservableObject {
    var trackDetailState: ScreenState<TrackDetail> { get set }
    var playerManager: AudioPlayerManager { get set }
    var getTrackDetailUseCase: GetTrackDetailUseCaseProtocol { get }
    
    func onAppear()
    func updateTrackInfo(trackId: Int)
}
