//
//  TrailerPlayerView.swift
//  ShortClip
//
//  Created by Bassam Hillo on 04/04/2025.
//

import SwiftUI
import AVFoundation

struct TrailerPlayerView: View {

    @Binding var reel: Reel
    @Binding var currentReel: String
    var watchNowAction: () -> Void

    @State private var showFullText = false
    @State private var isPlaying = true
    let lineLimit = 2 // Number of lines before showing "See more"

    var body: some View {
        ZStack(alignment: .bottom) {
            ReelsPlayer(
                reel: $reel,
                isPlay: $isPlaying,
                currentReel: $currentReel
            )
            overlay
        }
    }

    @ViewBuilder
    private var overlay: some View {
        HStack(alignment: .bottom) {
            detailsOverlay
            Spacer()
            actionsOverlay
        }
        .padding(.bottom, 16)
        .padding(.horizontal, 16)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.clear, Color.black.opacity(0.5)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
        )
    }

    @ViewBuilder
    private var detailsOverlay: some View {
        VStack(spacing: 10) {
            Text(reel.mediaFile?.title ?? "")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)

            VStack(alignment: .leading, spacing: 4) {
                Text(reel.mediaFile?.description ?? "")
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                    .lineLimit(showFullText ? nil : lineLimit)
                    .frame(maxWidth: .infinity, alignment: .leading)

                if let description = reel.mediaFile?.description, description.count > 63 {
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.3)) {
                            showFullText.toggle()
                        }
                    }) {
                        Text(showFullText ? "See less" : "See more")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.white)
                    }
                }
            }

            // Watch now button
            Button(action: {
                isPlaying = false
                watchNowAction()
            }) {
                Text("Watch Now  ▶")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundColor(.black)
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(10)
            }
        }
        .padding(.trailing, 30)
        .padding(.bottom, 5)
        // Gradient background
    }

    @ViewBuilder
    private var actionsOverlay: some View {
        VStack {
            ActionButton(systemImageName: "heart") {
                // action
            }
            ActionButton(systemImageName: "square.and.arrow.up") {
                // action
            }
            ActionButton(systemImageName: "text.bubble") {
                // action
            }
            ActionButton(systemImageName: "rectangle.expand.diagonal") {
                // action
            }
        }
    }

    private struct ActionButton: View {
        let systemImageName: String
        let action: () -> Void

        var body: some View {
            Button(action: action) {
                Image(systemName: systemImageName)
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .regular))
                    .padding(13)
                    .background(Blur(style: .systemUltraThinMaterialDark))
                    .clipShape(Circle())
            }
            .padding(.top, 5)
        }
    }
}

#Preview {
    let reel = MediaFileJson.map { medialFile -> Reel in
        let path = Bundle.main.path(forResource: medialFile.url, ofType: "mp4") ?? ""
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        return Reel(player: player, mediaFile: medialFile)
    }
        .first

    TrailerPlayerView(
        reel: .constant(reel ?? Reel()),
        currentReel: .constant("currentReel"),
        watchNowAction: { print("Watch Now action") }
    )
}
