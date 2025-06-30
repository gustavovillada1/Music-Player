//
//  PlayListWireframe.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 29/06/25.
//

import Foundation
import SwiftUI

class PlayListWireframe {
    @ViewBuilder
    public static func getPlayListView(playListId: Int) -> some View {
        let viewModel: PlayListViewModel = createViewModel(playListId: playListId)
        let rootView: PlayListScreen = PlayListScreen(viewModel: viewModel)
        
        NavigationView {
            rootView
        }
        //.environmentObject(navigation)
        .navigationBarHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private static func createViewModel(playListId: Int) -> PlayListViewModel {
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
        let getPlayListDetailUseCase: GetPlayListDetailUseCase = GetPlayListDetailUseCase(
            repository: repository,
            domainMapper: domainMapper
        )
        return PlayListViewModel(getPlayLisDetailtUseCase: getPlayListDetailUseCase, playListId: playListId)
    }
}
