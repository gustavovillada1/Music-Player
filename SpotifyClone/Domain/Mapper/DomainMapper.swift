//
//  DomainMapper.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 25/06/25.
//

import Foundation

struct DomainMapper {
    
    func mapTopTracks(domainTracks: [TopTracksDomain]) -> [Track] {
        return domainTracks.map { domainTrack in
            Track(
                id: domainTrack.id,
                title: domainTrack.title,
                link: domainTrack.link,
                preview: domainTrack.preview, 
                artist: mapTrackArtist(domainTrackArtist: domainTrack.artist),
                album: mapTrackAlbum(domainTrackAlbum: domainTrack.album)
            )
        }
    }
    
    private func mapTrackArtist(domainTrackArtist: TopTracksDataArtistDomain) -> TrackArtist {
        return TrackArtist(
            id: domainTrackArtist.id, 
            name: domainTrackArtist.name,
            picture: domainTrackArtist.picture
        )
    }
    
    private func mapTrackAlbum(domainTrackAlbum: TopTrackDataAlbumDomain) -> TrackAlbum {
        return TrackAlbum(
            id: domainTrackAlbum.id,
            title: domainTrackAlbum.title,
            cover: domainTrackAlbum.cover
        )
    }
}
