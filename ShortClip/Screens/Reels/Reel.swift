//
//  Reel.swift
//  ShortClip
//
//  Created by Bassam Hillo on 03/04/2025.
//


import Foundation
import AVKit

struct Reel: Identifiable {
    var id: String = UUID().uuidString
    var player: AVPlayer?
    var mediaFile: MediaFile?
}
