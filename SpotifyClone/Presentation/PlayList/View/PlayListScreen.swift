//
//  PlayListScreen.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 29/06/25.
//

import SwiftUI
import SwiftUIComponentsKit

struct PlayListScreen<ViewModel: PlayListViewModelProtocol>: View {
    @StateObject var viewModel: ViewModel
    @EnvironmentObject var playerManager: AudioPlayerManager
    
    var body: some View {
        ScrollView {
            VStack {
                switch viewModel.playListState {
                case .idle:
                    Text("")
                case .loading:
                    Text("")
                case .empty:
                    Text("Empty")
                case .error(let error):
                    Text(error.localizedDescription)
                case .success(let playListDetail):
                    getHeaderPlayListView(playListDetail)
                    getTrackListView(playListDetail.tracks)
                }
            }
        }
        .onAppear {
            viewModel.callGetPlayLisDetailUseCase()
        }
        .preferredColorScheme(.dark)
    }
    
    private func getHeaderPlayListView(_ playListDetail: PlayListDetail) -> some View {
        VStack {
            Text(playListDetail.title)
            let playListImage = URL(string: playListDetail.pictureBig)
            AsyncImage(url: playListImage) { phase in
                switch phase {
                case .empty:
                    Image(systemName: "")
                case .success(let image):
                    image
                case .failure(let error):
                    Text(error.localizedDescription)
                @unknown default:
                    Text("Default")
                }
            }
            .frame(width: 200, height: 200)
            
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "pause.circle.fill")
                }

            }
        }
    }
    
    private func getTrackListView(_ tracks: [TopTrack]) -> some View {
        VStack {
            ForEach(tracks, id: \.id) { track in
                let isPlaying: Bool = track.id == playerManager.currentTrackId && playerManager.isPlaying
                let isFocused: Bool = track.id == playerManager.currentTrackId
                ListItem(
                    imageUrl: track.albumImage,
                    title: track.title,
                    subtitle: track.artistName,
                    isPlaying: isPlaying,
                    isFocused: isFocused) {
                        playerManager.didTapOnTrack(track: track, playList: tracks)
                    }
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 40)
        .background(Color.black)
        .cornerRadius(30)
    }
        
}

