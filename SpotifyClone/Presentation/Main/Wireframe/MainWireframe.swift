//
//  MainWireframe.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 26/06/25.
//

import Foundation
import SwiftUI

class MainWireframe {
    @ViewBuilder
    public static func getMainView() -> some View {
        let navigation: AppNavigation = AppNavigation()
        let playerManager: AudioPlayerManager = AudioPlayerManager()
        let viewModel: MainViewModel = createViewModel(playerManager: playerManager)
        let rootView: MainView = MainView(viewModel: viewModel)
        
        NavigationView {
            rootView
        }
        .environmentObject(navigation)
        .navigationBarHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private static func createViewModel(playerManager: AudioPlayerManager) -> MainViewModel {
        let networkClient: NetworkClientProtocol = DefaultNetworkClient()
        let apiManager: ApiDataManagerProtocol = APIDataManager(networkClient: networkClient)
        let domainMapper: DomainMapper = DomainMapper()
        let dataMapper: DataMapper = DataMapper()
        let networkMapper: NetworkErrorMapper = NetworkErrorMapper()
        let repository: AppRepositoryProtocol = AppRepository(
            apiManager: apiManager,
            dataMapper: dataMapper,
            networkMapper: networkMapper
        )
        let getTrackDetailUseCase: GetTrackDetailUseCaseProtocol = GetTrackDetailUseCase(
            repository: repository,
            domainMapper: domainMapper
        )
        return MainViewModel(getTrackDetailUseCase: getTrackDetailUseCase, playerManager: playerManager)
    }
}
