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
                id: track.id,
                title: track.title,
                link: track.link,
                preview: track.preview,
                artist: mapTopTracksDataArtistDomain(artistDTO: track.artist),
                album: mapTopTrackDataAlbumDomain(albumDTO: track.album)
            )
        }
    }
    
    private func mapTopTracksDataArtistDomain(artistDTO: TopTracksDataArtistDTO) -> TopTracksDataArtistDomain {
        return TopTracksDataArtistDomain(
            id: artistDTO.id, 
            name: artistDTO.name,
            picture: artistDTO.picture
        )
    }
    
    private func mapTopTrackDataAlbumDomain(albumDTO: TopTrackDataAlbumDTO) -> TopTrackDataAlbumDomain {
        return TopTrackDataAlbumDomain(
            id: albumDTO.id, 
            title: albumDTO.title,
            cover: albumDTO.cover
        )
    }
}
