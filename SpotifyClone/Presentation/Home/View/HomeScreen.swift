//
//  HomeScreen.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 25/06/25.
//

import SwiftUI
import SwiftUIComponentsKit

struct HomeScreen<ViewModel: HomeViewModelProtocol>: View {
    @StateObject var viewModel: ViewModel
    @EnvironmentObject var playerManager: AudioPlayerManager
    @EnvironmentObject var navigation: AppNavigation

    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    topArtistsView
                    topTracksView
                    topPlayListsView
                    Spacer()
                }
            }.onAppear{
                viewModel.onAppear()
            }
            NavigationLink(
                destination: PlayListWireframe.getPlayListView(playListId: viewModel.playListIdSelected),
                isActive: $navigation.isPlayListScreenActive,
                label: {}
            )
        }
    }
    
    private var topTracksView: some View {
        VStack {
            SectionHeader(title: "Top Tracks")
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
                .padding(.top, 10)
            
            switch viewModel.topTracksState {
            case .empty:
                Text("Vacio")
            case .error(let error):
                Text(error.localizedDescription)
            case .success(let topTracks):
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 10) {
                        ForEach(topTracks, id: \.id) { track in
                            let isPlaying: Bool = track.id == playerManager.currentTrackId && playerManager.isPlaying
                            let isFocused: Bool = track.id == playerManager.currentTrackId
                            ListHorizontalItem(
                                imageURL: track.albumImage,
                                title: track.title,
                                subtitle: track.artistName,
                                style: .large,
                                isPlaying: isPlaying,
                                isFocused: isFocused,
                                action: {
                                    withAnimation {
                                        playerManager.didTapOnTrack(track: track, playList: topTracks)
                                    }
                                }
                            )
                        }
                    }
                }
                .padding()
            default:
                Text("")
            }

        }
    }
    
    private var topArtistsView: some View {
        VStack {
            SectionHeader(title: "Top Artists")
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
                .padding(.top, 80)
            
            switch viewModel.topArtistsState {
            case .idle:
                Text("Idle")
            case .loading:
                Text("Cargando")
            case .empty:
                Text("Vacío")
            case .error(let error):
                Text(error.localizedDescription)
            case .success(let topArtists):
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(topArtists, id: \.id) { artist in
                            ListHorizontalItem(
                                imageURL: artist.pictureBig,
                                title: artist.name,
                                style: .compact, action: {}
                            )
                        }
                    }
                }
                .padding()
            }
        }
    }
    
    private var topPlayListsView: some View {
        VStack {
            SectionHeader(title: "Top Playlists")
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
                .padding(.top, 10)
            switch viewModel.topPlayListsState {
            case .idle:
                Text("Idle")
            case .loading:
                Text("Cargando")
            case .empty:
                Text("Vacío")
            case .error(let error):
                Text(error.localizedDescription)
            case .success(let topPlayLists):
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(topPlayLists, id: \.id) { topPlayList in
                            ListHorizontalItem(
                                imageURL: topPlayList.pictureBig,
                                title: topPlayList.title,
                                subtitle: topPlayList.user.name,
                                style: .medium, action: {
                                    navigation.isPlayListScreenActive = true
                                    viewModel.playListIdSelected = topPlayList.id
                                }
                            )
                        }
                    }
                }
                .padding()
                .padding(.bottom, 200)
            }

        }
    }
}
