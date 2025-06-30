//
//  MainView.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 26/06/25.
//

import SwiftUI
import SwiftUIComponentsKit

struct MainView<ViewModel: MainViewModelProtocol>: View {
    @StateObject var viewModel: ViewModel
    @StateObject var playerManager: AudioPlayerManager = AudioPlayerManager()

    var body: some View {
        ZStack(alignment: .bottom) {
            BottomTabView<BottomTabItem>()
                .environmentObject(playerManager)
            if let trackPlaying: TopTrack = playerManager.trackPlaying {
                MusicMiniPlayerView(
                    isExpanded: $viewModel.playerManager.isExpanded,
                    title: trackPlaying.title,
                    artist: trackPlaying.artistName,
                    urlImage: trackPlaying.albumImage
                )
                .onPlayPause(isPlaying: playerManager.isPlaying) {
                    playerManager.didTapOnPlayButton()
                }
                .onRepeatTrack(isRepeatTrackOn: playerManager.isRepeatTrackOn, {
                    playerManager.isRepeatTrackOn.toggle()
                })
                .onAutoPlay(isAutoPlayOn: playerManager.isAutoPlayOn) {
                    playerManager.didTapOnAutoPlay()
                }
                .onPreviousTrack {
                    playerManager.didTapOnPreviousTrack()
                }
                .onNextTrack {
                    playerManager.didTapOnNextTrack()
                }
                .addExtraContentView {
                    extraContentView
                }
                .padding(.bottom, 65)
                .transition(.move(edge: .bottom))
            }
        }
        .onAppear {
            playerManager.setGetTrackDetailsFunction { trackId in
                viewModel.updateTrackInfo(trackId: trackId)
            }
        }
    }
    
    private var extraContentView: some View {
        VStack(alignment: .leading, spacing: 20) {
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 2)
                .opacity(0.3)
                .padding()
            switch viewModel.trackDetailState {
            case .idle:
                EmptyView()
            case .loading:
                Text("Loading")
            case .empty:
                Text("empty")
            case .error(let error):
                Text(error.localizedDescription)
            case .success(let trackDetails):
                VStack(alignment: .leading, spacing: 15) {
                    Text("Colaboradores")
                        .bold()
                    ScrollView(showsIndicators: false) {
                        LazyHStack {
                            ForEach(trackDetails.contributors, id: \.id) { colaborator in
                                ListHorizontalItem(
                                    imageURL: colaborator.pictureBig,
                                    title: colaborator.name, style: .compact, action: {}
                                )
                            }
                        }
                    }
                    
                    
                    Text("Album")
                        .bold()
                    HStack {
                        let urlString = URL(string: trackDetails.album.coverBig)
                        AsyncImage(url: urlString) { phase in
                            switch phase {
                            case .empty:
                                Icons.backwardFill.image
                                    .resizable()
                                    .scaledToFit()
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .font(.system(size: 30))
                            case .failure:
                                Icons.pauseFill.image
                                    .resizable()
                                    .scaledToFit()
                            @unknown default:
                                EmptyView()
                            }
                        }
                        .cornerRadius(10)
                        
                        VStack {
                            Text(trackDetails.album.title)
                                .bold()
                                .font(.system(size: 20))
                            Text(trackDetails.album.releaseDate)
                                .font(.title3)
                            Spacer()
                        }
                    }
                }
            }
        }
    }
    
    /*
    private var trackColaboratorsView: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Colaboradores")
                .bold()
            ScrollView(showsIndicators: false) {
                LazyHStack {
                    ForEach(trackDetails.contributors, id: \.id) { colaborator in
                        ListHorizontalItem(
                            imageURL: colaborator.pictureBig,
                            title: colaborator.name, style: .compact, action: {}
                        )
                    }
                }
            }
        }
    }
    
    private var trackAlbumView: some View {
        VStack(alignment: .leading, spacing: 15) {
                Text("Album")
                    .bold()
                HStack {
                    let urlString = URL(string: "")
                    AsyncImage(url: urlString) { phase in
                        switch phase {
                        case .empty:
                            Icons.backwardFill.image
                                .resizable()
                                .scaledToFit()
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                                .font(.system(size: 30))
                        case .failure:
                            Icons.pauseFill.image
                                .resizable()
                                .scaledToFit()
                        @unknown default:
                            EmptyView()
                        }
                    }
                    .cornerRadius(10)
                    
                    VStack {
                        Text("Nombre del album")
                            .bold()
                            .font(.system(size: 20))
                        Text("Albúm - 20/2012")
                            .font(.title3)
                        Spacer()
                    }
                }
        }
    }*/
}
