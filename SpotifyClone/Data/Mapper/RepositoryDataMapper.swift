//
//  DataMapper.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 25/06/25.
//

import Foundation

struct RepositoryDataMapper {
    
    func mapTopTracksDomain(topTracksDTO: TopTracksDTO) -> [TopTracksDomain] {
        return topTracksDTO.data.map { track in
            TopTracksDomain(
                id: track.id ?? String(),
                title: track.title ?? String(),
                link: String(),
                preview: String(),
                artist: mapTopTracksDataArtistDomain(artistDTO: track.user!),
                album: mapTopTrackDataAlbumDomain(albumDTO: track.artwork!)
            )
        }
    }
    
    private func mapTopTracksDataArtistDomain(artistDTO: TopTracksDataArtistDTO) -> TopTracksDataArtistDomain {
        return TopTracksDataArtistDomain(
            id: artistDTO.id ?? String(),
            name: artistDTO.name ?? String(),
            picture: artistDTO.coverPhoto?.smallPicture ?? String()
        )
    }
    
    private func mapTopTrackDataAlbumDomain(albumDTO: TopTracksDataArtWorkDTO) -> TopTrackDataAlbumDomain {
        return TopTrackDataAlbumDomain(
            id: String(),
            title: String(),
            cover: albumDTO.mediumPicture ?? String()
        )
    }
}
