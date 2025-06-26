//
//  MainViewModel.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 26/06/25.
//

import Foundation
import AVFoundation

// Audio player manager
class AudioPlayerManager: ObservableObject {
    private var player: AVPlayer?
    @Published var isPlaying: Bool = false
    
    func play(urlString: String) {
        guard let url = URL(string: urlString) else {
            print("URL inválida")
            return
        }
        
        if player != nil {
            if isPlaying {
                pause()
            } else {
                player?.play()
                isPlaying = true
            }
        } else {
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
}
