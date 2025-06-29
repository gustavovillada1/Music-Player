//
//  MainView.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 26/06/25.
//

import SwiftUI
import SwiftUIComponentsKit

struct MainView<PlayerManager: AudioPlayerManager>: View {
    @StateObject var playerManager: PlayerManager

    var body: some View {
        ZStack(alignment: .bottom) {
            BottomTabView<BottomTabItem>()
                .environmentObject(playerManager)
            if let trackPlaying: Track = playerManager.trackPlaying {
                MusicMiniPlayerView(
                    isExpanded: $playerManager.isExpanded,
                    title: trackPlaying.title,
                    artist: trackPlaying.artist.name,
                    urlImage: trackPlaying.album.cover,
                    isPlaying: playerManager.isPlaying,
                    onPlayPause: {
                        playerManager.onPlayPause()
                    },
                    onNextSong: {
                        playerManager.nextTrack()
                    },
                    onPreviousSong: {
                        playerManager.previousTrack()
                    }
                )
                .padding(.bottom, 65)
                .transition(.move(edge: .bottom))
            }
        }
    }
}
