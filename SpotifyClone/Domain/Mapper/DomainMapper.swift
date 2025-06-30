//
//  DomainMapper.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 25/06/25.
//

import Foundation

struct DomainMapper {
    
    // MARK: Top tracks mapper
    func mapTopTracks(domainTracks: [TopTracksDomain]) -> [TopTrack] {
        return domainTracks.map { domainTrack in
            TopTrack(
                id: domainTrack.id,
                title: domainTrack.title,
                preview: domainTrack.preview,
                artistName: domainTrack.artist.name,
                albumImage: domainTrack.album.cover
            )
        }
    }
    
    // MARK: Top artists mapper
    func mapToTopArtist(topArtistsDomain: [TopArtistsDomain]) -> [TopArtist] {
        return topArtistsDomain.map { topArtistDomain in
            TopArtist(
                id: topArtistDomain.id, 
                name: topArtistDomain.name, 
                pictureBig: topArtistDomain.pictureBig
            )
        }
    }
    
    // MARK: Top Playlists mapper
    func mapToTopPlaylists(topPlaylistsDomain: [TopPlayListDomain]) -> [TopPlayList] {
        return topPlaylistsDomain.map { topPlayListDomain in
            TopPlayList(
                id: topPlayListDomain.id, 
                title: topPlayListDomain.title,
                pictureBig: topPlayListDomain.pictureBig,
                user: mapToTopPlayListUser(topPlayListUserDomain: topPlayListDomain.user)
            )
        }
    }
    
    private func mapToTopPlayListUser(topPlayListUserDomain: TopPlayListUserDomain) -> TopPlayListUser {
        return TopPlayListUser(
            id: topPlayListUserDomain.id,
            name: topPlayListUserDomain.name
        )
    }
    
    // MARK: Track detail mapper
    func mapToTrackDetail(trackDetailDomain: TrackDetailDomain) -> TrackDetail {
        return TrackDetail(
            id: trackDetailDomain.id,
            title: trackDetailDomain.title,
            link: trackDetailDomain.link,
            duration: trackDetailDomain.duration,
            explicitLyrics: trackDetailDomain.explicitLyrics,
            preview: trackDetailDomain.preview,
            contributors: mapToTrackDetailContributors(contributorsDomain: trackDetailDomain.contributors),
            album: mapToTrackDetailAlbum(albumDomain: trackDetailDomain.album)
        )
    }
    
    private func mapToTrackDetailContributors(contributorsDomain: [TrackDetailContributorDomain]) -> [TrackDetailContributor] {
        return contributorsDomain.map { trackDetailContributorDomain in
            TrackDetailContributor(
                id: trackDetailContributorDomain.id ,
                name: trackDetailContributorDomain.name,
                pictureBig: trackDetailContributorDomain.pictureBig
            )
        }
    }
    
    private func mapToTrackDetailAlbum(albumDomain: TrackDetailAlbumDomain) -> TrackDetailAlbum {
        TrackDetailAlbum(
            id: albumDomain.id,
            title: albumDomain.title,
            coverBig: albumDomain.coverBig,
            releaseDate: albumDomain.releaseDate
        )
    }
    
    // MARK: PlayList detail mapper
    func mapToPlayListDetailDomain(playListDomain: PlayListDetailDomain) -> PlayListDetail {
        return PlayListDetail(
            id: playListDomain.id,
            title: playListDomain.title,
            description: playListDomain.description,
            duration: playListDomain.duration,
            fans: playListDomain.fans,
            pictureBig: playListDomain.pictureBig,
            creationDate: playListDomain.creationDate,
            creator: mapToPlayListDetailCreatorDomain(playListDetailCreatorDomain: playListDomain.creator),
            tracks: mapTopTracks(domainTracks: playListDomain.tracks)
        )
    }
    
    private func mapToPlayListDetailCreatorDomain(playListDetailCreatorDomain: PlayListDetailCreatorDomain) -> PlayListDetailCreator {
        return PlayListDetailCreator(
            id: playListDetailCreatorDomain.id,
            name: playListDetailCreatorDomain.name
        )
    }
}
