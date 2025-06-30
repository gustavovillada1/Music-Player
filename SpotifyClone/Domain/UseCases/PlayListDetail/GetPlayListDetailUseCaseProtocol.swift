//
//  GetPlayListDetailUseCaseProtocol.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 29/06/25.
//

import Foundation
import Combine

protocol GetPlayListDetailUseCaseProtocol {
    func execute(playListId: Int) -> AnyPublisher<PlayListDetail, AppError>
}
