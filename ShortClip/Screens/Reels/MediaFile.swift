//
//  MediaFile.swift
//  ShortClip
//
//  Created by Bassam Hillo on 03/04/2025.
//


import Foundation

struct MediaFile: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let description: String
    let url: String
}

var MediaFileJson = [
    MediaFile(
        title: "First episode of the series",
        description: "This is the first episode of the series that have a lot of fun and interesting things ",
        url: "01"
    ),
    MediaFile(
        title: "Second episode of the series",
        description: "This is the second episode of the series that have a lot of fun and interesting things",
        url: "02"
    ),
    MediaFile(
        title: "Third episode of the series",
        description: "This is the third episode of the series that have a lot of fun and interesting things",
        url: "03"
    ),
    MediaFile(
        title: "Fourth episode of the series",
        description: "This is the fourth episode of the series that have a lot of fun and interesting things",
        url: "04"
    )
]

var trailers = [
    MediaFile(
        title: "Trailer of this wonderful series",
        description: "This is the trailer of this wonderful series that have a lot of fun and interesting things This is the trailer of this wonderful series that have a lot of fun and interesting things",
        url: "Trailer"
    ),
    MediaFile(
        title: "Trailer of this wonderful series",
        description: "This is the trailer of this wonderful series that have a lot of fun and interesting things",
        url: "Trailer"
    ),
]
