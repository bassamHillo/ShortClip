//
//  TrailersView.swift
//  ShortClip
//
//  Created by Bassam Hillo on 04/04/2025.
//

import SwiftUI
import AVFoundation

struct TrailersView: View {
    @State var currentReel = ""

    @State var reels = trailers.map { medialFile -> Reel in
        let path = Bundle.main.path(forResource: medialFile.url, ofType: "mp4") ?? ""
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        return Reel(player: player, mediaFile: medialFile)
    }
    @State private var showDetail = false

    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                TabView(selection: $currentReel) {
                    ForEach($reels) { $reel in
                        TrailerPlayerView(
                            reel: $reel,
                            currentReel: $currentReel,
                            watchNowAction: {
                                showDetail = true
                            }
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
            .fullScreenCover(isPresented: $showDetail, content: {
                let reels = MediaFileJson.map { medialFile -> Reel in
                    let path = Bundle.main.path(forResource: medialFile.url, ofType: "mp4") ?? ""
                    let player = AVPlayer(url: URL(fileURLWithPath: path))
                    return Reel(player: player, mediaFile: medialFile)
                }

                ReelsView(reels: .constant(reels))
            })
        }
    }
}

#Preview {
    TrailersView()
}
