//
//  ReelsPlayer.swift
//  ShortClip
//
//  Created by Bassam Hillo on 03/04/2025.
//

import AVKit
import SwiftUI
import Combine

struct ReelsPlayer: View {
    @Binding var reel: Reel
    @Binding var isPlay: Bool
    @Binding var currentReel: String
    @State private var progress: Double = 0
    @State private var duration: Double = 1
    @State private var timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()

    var body: some View {
        ZStack {
            if let player = reel.player {
                CustomVideoPlayer(player: player)
                geometryMonitorView(player: player)
                tapGestureView()
                playPauseOverlay()
                VStack {
                    Spacer()
                    scrollableProgressBar(player: player)
                }
            }
        }
        .onChange(of: isPlay, { oldValue, newValue in
            newValue ? reel.player?.play() : reel.player?.pause()
        })
        .onReceive(timer) { _ in
            updateProgress()
        }
        .onDisappear {
            pausePlayer()
            timer.upstream.connect().cancel()
        }
    }

    // MARK: - Subviews

    private func geometryMonitorView(player: AVPlayer) -> some View {
        GeometryReader { proxy in
            Color.clear
                .preference(key: ScrollPositionKey.self, value: proxy.frame(in: .global).minY)
                .onPreferenceChange(ScrollPositionKey.self) { minY in
                    handleScrollPositionChange(minY: minY, proxy: proxy, player: player)
                }
        }
    }

    private func tapGestureView() -> some View {
        Color.black
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .opacity(0.01)
            .onTapGesture(perform: togglePlaying)
    }

    private func playPauseOverlay() -> some View {
        Image(systemName: isPlay ? "pause.fill" : "play.fill")
            .font(.title)
            .foregroundColor(.secondary)
            .padding()
            .background(.secondary)
            .clipShape(Circle())
            .foregroundStyle(.black)
            .opacity(!isPlay ? 1 : 0)
            .onTapGesture(perform: togglePlaying)
    }

    private func scrollableProgressBar(player: AVPlayer) -> some View {
        ZStack(alignment: .leading) {
            GeometryReader { proxy in
                Capsule()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 4)
                    .frame(width: proxy.size.width)

                Capsule()
                    .fill(Color.white)
                    .frame(width: CGFloat(progress) * proxy.size.width, height: 4)
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 4)
    }
    // MARK: - Playback Logic

    private func handleScrollPositionChange(minY: CGFloat, proxy: GeometryProxy, player: AVPlayer) {
        let size = proxy.size
        DispatchQueue.main.async {
            let isVisible = -minY < (size.height / 2) && minY < (size.height / 2)
            let isCurrentReel = currentReel == reel.id

            if isVisible && isCurrentReel && isPlay {
                player.play()
            } else {
                player.pause()
            }
        }
    }

    private func togglePlaying() {
        isPlay.toggle()
        isPlay ? reel.player?.play() : reel.player?.pause()
    }

    private func pausePlayer() {
        reel.player?.pause()
    }

    private func updateProgress() {
        guard let player = reel.player,
              let currentItem = player.currentItem else { return }

        duration = currentItem.duration.seconds.isNaN ? 1 : currentItem.duration.seconds
        progress = player.currentTime().seconds / duration
    }
}

// MARK: - Scroll Position Preference Key

struct ScrollPositionKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
