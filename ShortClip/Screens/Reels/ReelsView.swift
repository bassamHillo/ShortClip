//
//  ReelsView.swift
//  ShortClip
//
//  Created by Bassam Hillo on 03/04/2025.
//

import SwiftUI
import AVFoundation

struct ReelsView: View {

    @State var currentReel = ""
    @Binding var reels: [Reel]

    var body: some View {
        GeometryReader { proxy in
            
            TabView(selection: $currentReel) {
                ForEach($reels) { $reel in
                    DetailsPlayerView(
                        reel: $reel,
                        currentReel: $currentReel,
                        episodesCount: reels.count,
                        currentEpisodeNumber: (reels.firstIndex(where: { $0.id == reel.id }) ?? 0) + 1
                    )
                    .frame(width: proxy.size.width)
                    .padding()
                    .rotationEffect(Angle(degrees: -90))
                    .ignoresSafeArea(.all, edges: .top)
                    .tag(reel.id)
                }
            }
            .rotationEffect(Angle(degrees: 90))
            .frame(width: proxy.size.height)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(maxWidth: proxy.size.width)
        }
        .ignoresSafeArea(.all, edges: .top)
        .background(.black)
        .onAppear {
            currentReel = reels.first?.id ?? ""
        }
    }
}

struct ReelsView_Previews: PreviewProvider {
    static var previews: some View {
        let reels = MediaFileJson.map { medialFile -> Reel in
            let path = Bundle.main.path(forResource: medialFile.url, ofType: "mp4") ?? ""
            let player = AVPlayer(url: URL(fileURLWithPath: path))
            return Reel(player: player, mediaFile: medialFile)
        }

        ReelsView(reels: .constant(reels))
    }
}
