//
//  HomeWireframe.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 25/06/25.
//

import Foundation
import SwiftUI

class HomeWireframe {
    
    @ViewBuilder
    public static func getHomeScreen() -> some View {
        //let navigation: MobileCandidateAppNavigation = MobileCandidateAppNavigation()
        let viewModel: HomeViewModel = createViewModel()
        let rootView: HomeScreen = HomeScreen(viewModel: viewModel)
        
        NavigationView {
            rootView
        }
        //.environmentObject(navigation)
        .navigationBarHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private static func createViewModel() ->  HomeViewModel {
        let networkClient: DefaultNetworkClient = DefaultNetworkClient()
        let dataMapper: RepositoryDataMapper = RepositoryDataMapper()
        let apiManager: ApiDataManagerProtocol = APIDataManager(networkClient: networkClient)
        let domainMapper: DomainMapper = DomainMapper()
        let repository: AppRepositoryProtocol = AppRepository(apiManager: apiManager, dataMapper: dataMapper)
        let getTopTracksUseCase: GetTopTracksUseCaseProtocol = GetTopTracksUseCase(repository: repository, domainMapper: domainMapper)
        
        return HomeViewModel(getTopTracksUseCase: getTopTracksUseCase)
    }
}
