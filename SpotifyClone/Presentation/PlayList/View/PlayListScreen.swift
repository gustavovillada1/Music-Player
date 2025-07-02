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
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
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
                getTopBarView(title: playListDetail.title )
                ScrollView {
                    LazyVStack {
                        getHeaderPlayListView(playListDetail)
                        getTrackListView(playListDetail.tracks)
                    }
                }
            }
        }
        .onAppear {
            viewModel.callGetPlayLisDetailUseCase()
        }
        .preferredColorScheme(.dark)
    }
    
    private func getTopBarView(title: String) -> some View {
        TopBarCustom(
            title: title,
            onBack: {
                presentationMode.wrappedValue.dismiss()
            },
            trailingIcon: nil,
            trailingAction: nil
        )
    }
    
    private func getHeaderPlayListView(_ playListDetail: PlayListDetail) -> some View {
        VStack {
            let playListImage = URL(string: playListDetail.pictureBig)
            AsyncImage(url: playListImage) { phase in
                switch phase {
                case .empty:
                    Image(systemName: "")
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                case .failure(let error):
                    Text(error.localizedDescription)
                @unknown default:
                    Text("Default")
                }
            }
            .frame(width: 300, height: 300)
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

