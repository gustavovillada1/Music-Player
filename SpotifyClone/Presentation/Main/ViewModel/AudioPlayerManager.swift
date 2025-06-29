//
//  MainViewModel.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 26/06/25.
//

import Foundation
import AVFoundation
import Combine

// Audio player manager
class AudioPlayerManager: ObservableObject {
    private var player: AVPlayer?
    @Published var isPlaying: Bool = false
    @Published var trackPlaying: Track?
    @Published var playList: [Track] = []
    @Published var isExpanded: Bool = false

    var currentPlayListIndex: Int = 0
    var currentTrackId: String = ""
    var currentTrackUrl: String = ""

    func play(trackId: String) {
        let newURLString = "https://discoveryprovider.audius.co/v1/tracks/\(trackId)/stream"

        guard let url = URL(string: newURLString) else {
            print("URL inválida: \(newURLString)")
            return
        }

        // Si es una canción diferente, crea un nuevo player
        if currentTrackId != trackId {
            currentTrackId = trackId
            currentTrackUrl = newURLString

            let playerItem = AVPlayerItem(url: url)
            player = AVPlayer(playerItem: playerItem)
            player?.play()
            isPlaying = true
            return
        }

        // Si es la misma canción y ya hay un player, alternar entre pausa y reproducción
        if let player = player {
            if isPlaying {
                player.pause()
                isPlaying = false
            } else {
                player.play()
                isPlaying = true
            }
        } else {
            // Caso borde: no hay player, pero el track ID es el mismo
            let playerItem = AVPlayerItem(url: url)
            player = AVPlayer(playerItem: playerItem)
            player?.play()
            isPlaying = true
        }
    }

    
    func pause() {
        player?.pause()
        isPlaying = false
    }

    func stop() {
        player?.pause()
        player?.seek(to: .zero)
        isPlaying = false
    }
    
    func nextTrack() {
        let nextIndex = currentPlayListIndex + 1
        guard playList.indices.contains(nextIndex) else {
            return
        }

        currentPlayListIndex = nextIndex
        let nextTrack = playList[nextIndex]
        trackPlaying = nextTrack
        play(trackId: nextTrack.id)
    }
    
    func previousTrack() {
        let previousIndex = currentPlayListIndex - 1
        guard playList.indices.contains(previousIndex) else {
            return
        }

        currentPlayListIndex = previousIndex
        let previousTrack = playList[previousIndex]
        trackPlaying = previousTrack
        play(trackId: previousTrack.id)
    }
    
    func onPlayPause() {
        if isPlaying {
            pause()
        } else {
            if let trackPlaying: Track = trackPlaying {
                play(trackId: trackPlaying.id)
            }
        }
    }
    
    func setTrackPlaying(track: Track) {
        trackPlaying = track
        if let index = playList.firstIndex(where: { $0.id == track.id }) {
            currentPlayListIndex = index
        }
    }
    
    func setAudioManagerPlayList(tracks: [Track]) {
        playList = tracks
    }
}
