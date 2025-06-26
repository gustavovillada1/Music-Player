//
//  HomeViewModelProtocol.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 25/06/25.
//

import Foundation

protocol HomeViewModelProtocol: ObservableObject {
    var getTopTracksUseCase: GetTopTracksUseCaseProtocol { get }
    var topTracks: [Track] { get set }
    var isLoadingTopTracks: Bool { get set }
    
    func onAppear() 
}
