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

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                topArtistsView
                topSongsView
                recommendedForYouView
                Spacer()
            }
        }.onAppear{
            viewModel.onAppear()
        }
    }
    
    private var topSongsView: some View {
        VStack {
            if viewModel.isLoadingTopTracks {
                Text("Cargando")
            } else {
                SectionHeader(title: "Top Tracks")
                    .addRightAction(subtitle: "")
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                    .padding(.top, 10)
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 10) {
                        ForEach(viewModel.topTracks, id: \.id) { track in
                            ListHorizontalItem(
                                imageURL: track.album.cover,
                                title: track.title,
                                subtitle: track.artist.name,
                                style: .large, action: {}
                            )
                        }
                    }
                }
                .padding()
            }
        }
    }
    
    private var topArtistsView: some View {
        VStack {
            SectionHeader(title: "Top Artists")
                .addRightAction(subtitle: "")
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
                .padding(.top, 80)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(0..<5) { i in
                        ListHorizontalItem(
                            imageURL: "",
                            title: "Artist \(i + 1)",
                            subtitle: "Pop",
                            style: .medium, action: {}
                        )
                    }
                }
            }
            .padding()
        }
    }
    
    private var recommendedForYouView: some View {
        VStack {
            SectionHeader(title: "Genders")
                .addRightAction(subtitle: "")
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
                .padding(.top, 10)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(0..<5) { i in
                        ListHorizontalItem(
                            imageURL: "",
                            title: "Reggaeton \(i + 1)",
                            subtitle: "Pop",
                            style: .compact, action: {}
                        )
                    }
                }
            }
            .padding()
            .padding(.bottom, 200)
        }
    }
}
