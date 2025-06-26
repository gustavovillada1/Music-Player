//
//  MainView.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 26/06/25.
//

import SwiftUI
import SwiftUIComponentsKit

struct MainView: View {
    @StateObject private var playerManager = AudioPlayerManager()

    var body: some View {
        ZStack(alignment: .bottom) {
            BottomTabView<BottomTabItem>()
            MusicMiniPlayerView(
                isExpanded: Binding.constant(false),
                title: "Titulo",
                artist: "Artist",
                urlImage: "https://static-cse.canva.com/blob/2075108/1600w-TR_QZBpRCG4.jpg",
                isPlaying: playerManager.isPlaying,
                onPlayPause: {
                    if playerManager.isPlaying {
                        playerManager.pause()
                    } else {
                        playerManager.play(urlString: "https://discoveryprovider.audius.co/v1/tracks/91dK9N2/stream")
                    }
                },
                onNextSong: {},
                onPreviousSong: {}
            )
            .padding(.bottom, 65)
            .transition(.move(edge: .bottom))
        }    }
}

#Preview {
    MainView()
}
