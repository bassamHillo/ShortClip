//
//  ContinueWatchSection.swift
//  ShortClip
//
//  Created by Bassam Hillo on 03/04/2025.
//

import SwiftUI

struct ContinueWatchModel {
    var title: String
    var subTitle: String
    var image: ImageResource
    var progress: CGFloat
}

struct ContinueWatchSection: View {

    var sections: [ContinueWatchModel]

    var body: some View {
        Section(header: header) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(0..<sections.count, id: \.self) { index in
                        ContinueWatchCardView(section: sections[index])
                            .padding(0)
                            .padding(.leading, index == 0 ? 20 : 0)
                            .padding(.top, 10)
                    }
                }
            }
        }
        .listRowBackground(Color.clear)
        .listRowSeparator(.hidden)
        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
    }

    private var header: some View {
        HStack {
            Text("Continue Watch")
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(.white)
                .textCase(.none)
            Spacer()
            Button {
                // action
            } label: {
                Text("See all")
                    .font(.system(size: 13, weight: .regular))
                    .foregroundColor(.white)
                    .textCase(.none)
            }
        }
        .padding(.horizontal, 20)
    }
}

struct ContinueWatchCardView: View {

    let section: ContinueWatchModel

    var body: some View {
        VStack(spacing: 10) {
            ZStack {
                let width = UIScreen.main.bounds.width * 0.8
                let height = width * 0.7

                Image(section.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width * 0.8, height: height)
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                VStack {
                    Spacer()
                    overlayView
                }
            }

            progressView
        }
    }

    private var overlayView: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(section.title)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(.white)
                    .cornerRadius(5)

                Text(section.subTitle)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
                    .cornerRadius(5)
            }
            .padding(.leading, 5)
            Spacer()

            Button {
                // action
            } label: {
                Image(systemName: "play.fill")
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .bold))
                    .padding(10)
                    .background((Blur(style: .systemThinMaterialDark)))
                    .clipShape(Circle())
            }
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 10)
        .background((Blur(style: .systemUltraThinMaterialDark)))
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .padding(.horizontal, 10)
        .padding(.bottom, 10)
        .environment(\.colorScheme, .dark)
    }

    private var progressView: some View {
        ProgressView(value: section.progress, total: 1)
            .progressViewStyle(LinearProgressViewStyle(tint: .green))
            .frame(height: 5)
            .padding(.horizontal, 10)
            .padding(.bottom, 10)
    }
}

#Preview {
    DashboardView()
}
