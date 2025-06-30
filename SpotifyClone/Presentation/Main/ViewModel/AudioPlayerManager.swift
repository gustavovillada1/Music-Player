//
//  MainViewModel.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 26/06/25.
//

import Foundation
import AVFoundation
import Combine

class AudioPlayerManager: ObservableObject {
    
    // MARK: Atributes
    
    /// Determine if the track is playing or not
    @Published var isPlaying: Bool = false
    
    /// Determine the list to playing without stop
    @Published var playList: [TopTrack] = []
    
    /// Determine if the MusicMiniPlayer should be expanded
    @Published var isExpanded: Bool = false
    
    /// Determine if when the current track ends should play the next one
    @Published var isAutoPlayOn: Bool = true
    
    /// Determine if when the current track ends should play again
    @Published var isRepeatTrackOn: Bool = false
    
    /// The current track wich is playing
    public var trackPlaying: TopTrack?
    
    /// The curren trackId
    public var currentTrackId: Int = 0

    /// The object which contains all the logic for playing audio
    private var player: AVPlayer?
    
    /// Determine the index in the array playlist of the current track
    private var currentPlayListIndex: Int = 0
    
    /// Determine the current track's url.
    private var currentTrackUrl: String = String()
    
    private var cancellables: Set<AnyCancellable> = Set<AnyCancellable>()
    
    private var getTrackDetails: (Int) -> Void = {_ in}

    
    // MARK: Initializer
    init() {
        NotificationCenter.default.publisher(for: .AVPlayerItemDidPlayToEndTime)
            .sink { [weak self] _ in
                guard let self = self else { return }
                
                let existNextTrack: Bool = self.playList.indices.contains(self.currentPlayListIndex + 1)
                
                if self.isRepeatTrackOn {
                    self.stop()
                    self.play(trackId: currentTrackId, trackPreview: currentTrackUrl)
                    return
                }
                
                if self.isAutoPlayOn && existNextTrack {
                    self.nextTrack()
                } else {
                    self.stop()
                }
            }
            .store(in: &cancellables)
    }

    // MARK: Private functions
    private func play(trackId: Int, trackPreview: String) {
        guard let url = URL(string: trackPreview) else {
            print("URL inválida: \(trackPreview)")
            return
        }

        // Si es una canción diferente, crea un nuevo player
        if currentTrackId != trackId {
            if isExpanded {
                getTrackDetails(trackId)
            }
            currentTrackId = trackId
            currentTrackUrl = trackPreview

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
    
    private func pause() {
        player?.pause()
        isPlaying = false
    }

    private func stop() {
        player?.pause()
        player?.seek(to: .zero)
        isPlaying = false
    }
    
    private func nextTrack() {
        let nextIndex = currentPlayListIndex + 1
        guard playList.indices.contains(nextIndex) else {
            return
        }
        currentPlayListIndex = nextIndex
        let nextTrack = playList[nextIndex]
        trackPlaying = nextTrack
        play(trackId: nextTrack.id, trackPreview: nextTrack.preview)
    }
    
    private func previousTrack() {
        let previousIndex = currentPlayListIndex - 1
        guard playList.indices.contains(previousIndex) else {
            return
        }

        currentPlayListIndex = previousIndex
        let previousTrack = playList[previousIndex]
        trackPlaying = previousTrack
        play(trackId: previousTrack.id, trackPreview: previousTrack.preview)
    }
    
    private func setTrackPlaying(track: TopTrack) {
        trackPlaying = track
        if let index = playList.firstIndex(where: { $0.id == track.id }) {
            currentPlayListIndex = index
        }
    }
    
    private func setPlayList(tracks: [TopTrack], trackId: Int) {
        playList = tracks
        for (index, track) in tracks.enumerated() {
            if track.id == trackId {
                currentPlayListIndex = index
                break
            }
        }
    }
    
    // MARK: Public functions
    func didTapOnNextTrack() {
        nextTrack()
    }
    
    func didTapOnPreviousTrack() {
        previousTrack()
    }
    
    func didTapOnPlayButton() {
        if isPlaying {
            pause()
        } else {
            if let trackPlaying: TopTrack = trackPlaying {
                play(trackId: trackPlaying.id, trackPreview: trackPlaying.preview)
            }
        }
    }
    
    func didTapOnTrack(track: TopTrack, playList: [TopTrack]) {
        isExpanded = true
        play(trackId: track.id, trackPreview: track.preview)
        setTrackPlaying(track: track)
        setPlayList(tracks: playList, trackId: track.id)
    }
    
    func didTapOnAutoPlay() {
        isAutoPlayOn.toggle()
    }

    func setGetTrackDetailsFunction(getTrackDetails: @escaping (Int) -> Void) {
        self.getTrackDetails = getTrackDetails
    }
}
