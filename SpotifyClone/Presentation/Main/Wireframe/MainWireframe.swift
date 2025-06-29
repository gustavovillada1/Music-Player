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
        let viewModel: AudioPlayerManager = createViewModel()
        let rootView: MainView = MainView(playerManager: viewModel)
        
        NavigationView {
            rootView
        }
        //.environmentObject(navigation)
        .navigationBarHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private static func createViewModel() ->  AudioPlayerManager {
        return AudioPlayerManager()
    }
}
