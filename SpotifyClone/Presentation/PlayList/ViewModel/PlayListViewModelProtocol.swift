//
//  PlayListViewModelProtocol.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 29/06/25.
//

import Foundation

protocol PlayListViewModelProtocol: ObservableObject {
    var playListState: ScreenState<PlayListDetail> { get set }
    var getPlayLisDetailtUseCase: GetPlayListDetailUseCaseProtocol { get }
    
    func callGetPlayLisDetailUseCase()
}
