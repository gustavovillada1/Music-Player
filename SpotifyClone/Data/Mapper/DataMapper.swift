//
//  DataMapper.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 25/06/25.
//

import Foundation

struct DataMapper {
    
    // MARK: Top tracks mapper
    func mapTopTracksDomain(topTracksDTO: TopTracksDTO) -> [TopTracksDomain] {
        return topTracksDTO.data.map { track in
            TopTracksDomain(
                id: track.id ?? 0,
                title: track.title ?? String(),
                preview: track.preview ?? String(),
                artist: mapTopTracksDataArtistDomain(artistDTO: track.artist),
                album: mapTopTrackDataAlbumDomain(albumDTO: track.album)
            )
        }
    }

    private func mapTopTracksDataArtistDomain(artistDTO: TopTracksDataArtistDTO) -> TopTracksDataArtistDomain {
        return TopTracksDataArtistDomain(name: artistDTO.name ?? String())
    }
    
    private func mapTopTrackDataAlbumDomain(albumDTO: TopTrackDataAlbumDTO) -> TopTrackDataAlbumDomain {
        return TopTrackDataAlbumDomain(cover: albumDTO.bigCover ?? String())
    }
    
    // MARK: Top artists mapper
    func mapToTopArtistsDomain(topArtistsDTO: TopArtistsDTO) -> [TopArtistsDomain] {
        return topArtistsDTO.data.map { topArtistsDTO in
            TopArtistsDomain(
                id: topArtistsDTO.id ?? 0,
                name: topArtistsDTO.name ?? String(),
                pictureBig: topArtistsDTO.pictureBig ?? String()
            )
        }
    }
    
    
    // MARK: Top playlists mapper
    func mapToTopPlayListsDomain(topPlayListsDTO: TopPlayListDTO) -> [TopPlayListDomain] {
        return topPlayListsDTO.data.map { topPlayListDataDTO in
            TopPlayListDomain(
                id: topPlayListDataDTO.id ?? 0,
                title: topPlayListDataDTO.title ?? String(),
                pictureBig: topPlayListDataDTO.pictureBig ?? String(),
                user: mapToTopPlayListUserDomain(topPlayListUserDTO: topPlayListDataDTO.user)
            )
        }
    }
    
    private func mapToTopPlayListUserDomain(topPlayListUserDTO: TopPlayListDataUserDTO) -> TopPlayListUserDomain {
        return TopPlayListUserDomain(id: topPlayListUserDTO.id ?? 0, name: topPlayListUserDTO.name ?? String())
    }
    
    // MARK: Track detail mapper
    func mapToTrackDetailDomain(trackDetailDTO: TrackDetailDTO) -> TrackDetailDomain {
        return TrackDetailDomain(
            id: trackDetailDTO.id ?? 0,
            title: trackDetailDTO.title ?? String(),
            link: trackDetailDTO.link ?? String(),
            duration: trackDetailDTO.duration ?? 0,
            explicitLyrics: trackDetailDTO.explicitLyrics ?? true,
            preview: trackDetailDTO.preview ?? String(),
            contributors: mapToTrackDetailContributorsDomain(contributorsDTO: trackDetailDTO.contributors),
            album: mapToTrackDetailAlbumDomain(albumDTO: trackDetailDTO.album)
        )
    }
    
    private func mapToTrackDetailContributorsDomain(contributorsDTO: [TrackDetailContributorDTO]) -> [TrackDetailContributorDomain] {
        return contributorsDTO.map { trackDetailContributorDTO in
            TrackDetailContributorDomain(
                id: trackDetailContributorDTO.id ?? 0,
                name: trackDetailContributorDTO.name ?? String(),
                pictureBig: trackDetailContributorDTO.pictureBig ?? String()
            )
        }
    }
    
    private func mapToTrackDetailAlbumDomain(albumDTO: TrackDetailAlbumDTO) -> TrackDetailAlbumDomain {
        TrackDetailAlbumDomain(
            id: albumDTO.id ?? 0,
            title: albumDTO.title ?? String(),
            coverBig: albumDTO.coverBig ?? String(),
            releaseDate: albumDTO.releaseDate ?? String()
        )
    }
    
    
    // MARK: PlayList detail mapper
    func mapToPlayListDetailDomain(playListDTO: PlayListDetailDTO) -> PlayListDetailDomain {
        return PlayListDetailDomain(
            id: playListDTO.id ?? 0,
            title: playListDTO.title ?? String(),
            description: playListDTO.description ?? String(),
            duration: playListDTO.duration ?? 0,
            fans: playListDTO.fans ?? 0,
            pictureBig: playListDTO.pictureBig ?? String(),
            creationDate: playListDTO.creationDate ?? String(),
            creator: mapToPlayListDetailCreatorDomain(playListDetailCreatorDTO: playListDTO.creator),
            tracks: mapTopTracksDomain(topTracksDTO: playListDTO.tracks)
        )
    }
    
    private func mapToPlayListDetailCreatorDomain(playListDetailCreatorDTO: PlayListDetailCreatorDTO) -> PlayListDetailCreatorDomain {
        return PlayListDetailCreatorDomain(
            id: playListDetailCreatorDTO.id ?? 0,
            name: playListDetailCreatorDTO.name ?? String()
        )
    }
}
