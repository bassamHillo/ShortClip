//
//  NewSeriesSection.swift
//  ShortClip
//
//  Created by Bassam Hillo on 03/04/2025.
//

import SwiftUI

struct NewSeriesSectionModel {
    let fromString: String
    let items: [NewSeriesModel]
}

struct NewSeriesModel {
    let cover: ImageResource
    let episodesCount: Int
}

struct NewSeriesSection: View {

    let model: NewSeriesSectionModel

    var body: some View {
        Section(header: header) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(0..<model.items.count, id: \.self) { index in
                        NewSeriesItem(item: model.items[index])
                            .padding(0)
                            .padding(.leading, index == 0 ? 20 : 0)
                    }
                }
            }
            .padding(.top, 10)
        }
        .listRowBackground(Color.clear)
        .listRowSeparator(.hidden)
        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
    }

    private var header: some View {
        HStack {
            Text("New Series from \(model.fromString)")
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

struct NewSeriesItem: View {
    let item: NewSeriesModel

    var body: some View {
        Image(item.cover)
            .resizable()
            .scaledToFill()
            .frame(width: 208, height: 298)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay(alignment: .bottomLeading) {
                episodesCount
                .padding(.horizontal, 15)
                .padding(.bottom, 15)
            }
            .padding(.top, 0)
    }

    private var episodesCount: some View {
        Text("\(item.episodesCount) Episodes")
            .font(.system(size: 17, weight: .regular))
            .foregroundColor(.white)
            .padding(.horizontal, 10)
            .padding(.vertical, 8)
            .background((Blur(style: .systemUltraThinMaterialDark)))
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}


#Preview {
    NewSeriesSection(model: NewSeriesSectionModel(
        fromString: "China",
        items: [NewSeriesModel(
            cover: .china1,
            episodesCount: 16
        )]
    ))
    .background(.black)
}
