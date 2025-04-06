//
//  DetailsPlayerView.swift
//  ShortClip
//
//  Created by Bassam Hillo on 04/04/2025.
//

import SwiftUI
import AVFoundation

struct DetailsPlayerView: View {

    @Binding var reel: Reel
    @Binding var currentReel: String
    @Environment(\.presentationMode) var presentationMode

    @State private var isPlaying = true

    let episodesCount: Int
    let currentEpisodeNumber: Int

    var topSafeArea: CGFloat {
        UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0
    }

    var body: some View {
        ReelsPlayer(
            reel: $reel,
            isPlay: $isPlaying,
            currentReel: $currentReel
        )
        .overlay(alignment: .top) {
            topOverlay
                .padding(.top, topSafeArea - 20)
        }
        .overlay(alignment: .bottomTrailing, content: {
            actionsOverlay
                .padding(16)
        })
        .navigationBarBackButtonHidden(true)
    }

    @ViewBuilder
    private var topOverlay: some View {
        HStack(spacing: 0) {
            // Back button
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
                    .padding()
            }

            // title
            Text(reel.mediaFile?.title ?? "")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)

            // episode count from all label
            Text("\(currentEpisodeNumber)/\(episodesCount)")
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.white)
                .padding(5)
                .background(Blur(style: .systemUltraThinMaterialDark))
                .clipShape(RoundedRectangle(cornerRadius: 5))
        }
        .padding(.trailing)
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

    DetailsPlayerView(
        reel: .constant(reel ?? Reel()),
        currentReel: .constant("reel?.id" ?? ""),
        episodesCount: 10,
        currentEpisodeNumber: 1
    )
}
