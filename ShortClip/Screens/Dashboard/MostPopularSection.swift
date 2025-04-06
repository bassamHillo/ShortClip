//
//  MostPopularSection.swift
//  ShortClip
//
//  Created by Bassam Hillo on 03/04/2025.
//

import SwiftUI

struct MostPopularModel {
    let cover: ImageResource
    let title: String
    let tags: [String]
    let rate: String
    let episodesCount: Int?
}

struct MostPopularSection: View {
    var items: [MostPopularModel]

    var body: some View {
        Section(header: header) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(0..<items.count, id: \.self) { index in
                        MostPopularItem(item: items[index])
                            .padding(0)
                            .padding(.leading, index == 0 ? 20 : 0)
                            .padding(.top, 10)
                    }
                }
            }
        }
        .listRowBackground(Color.clear)
        .listRowSeparator(.hidden)
        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
    }

    private var header: some View {
        HStack {
            Text("Most Popular")
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

struct MostPopularItem: View {
    let item: MostPopularModel

    var body: some View {
        Image(item.cover)
            .resizable()
            .scaledToFill()
            .frame(width: 208, height: 298)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay(alignment: .bottomLeading) {
                VStack(alignment: .leading, spacing: 0) {
                    Text(item.title)
                        .font(.system(size: 17, weight: .bold))
                        .foregroundColor(.white)
                    tagsTextView
                        .padding(.bottom, 15)
                    episodesCount
                }
                .padding(.horizontal, 15)
                .padding(.bottom, 15)
            }
            .overlay(alignment: .top) {
                topView
            }
    }

    // Top view that contains one star and rate at left and hard button in right
    private var topView: some View {
        HStack(spacing: 5) {
            HStack(spacing: 3) {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .font(.system(size: 15, weight: .bold))
                Text(item.rate)
                    .font(.system(size: 15, weight: .bold))
                    .foregroundColor(.white)
            }
            .padding(.leading, 5)
            .padding(.trailing, 9)
            .padding(.vertical, 6)
            .background((Blur(style: .systemUltraThinMaterialDark)))
            .clipShape(RoundedRectangle(cornerRadius: 20))

            Spacer()
            Button {
                // action
            } label: {
                Image(systemName: "heart.fill")
                    .foregroundColor(
                        Color(
                            red: 253 / 255,
                            green: 211 / 255,
                            blue: 208 / 255
                        )
                    )
                    .font(.system(size: 15, weight: .bold))
                    .padding(8)
                    .background((Blur(style: .systemUltraThinMaterialDark)))
                    .clipShape(Circle())
            }
        }
        .padding(10)
    }

    private var episodesCount: some View {
        let text = item.episodesCount != nil ?
        "\(item.episodesCount ?? 0) Episodes" :
        "Movies"

        return Text(text)
            .font(.system(size: 17, weight: .regular))
            .foregroundColor(.white)
            .padding(.horizontal, 10)
            .padding(.vertical, 8)
            .background((Blur(style: .systemUltraThinMaterialDark)))
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }

    private var tagsTextView: some View {
        Text(item.tags.joined(separator: " • "))
            .font(.system(size: 13, weight: .medium))
            .foregroundColor(.white)
    }
}

#Preview {
    MostPopularSection(
        items: [
            .init(
                cover: .most1,
                title: "Title 1",
                tags: ["Action", "Adventure"],
                rate: "8.5",
                episodesCount: 12
            ),
        ]
    )
    .listSectionSpacing(0)
    .background(.black)
}


