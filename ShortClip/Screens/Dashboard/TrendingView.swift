//
//  TrendingView.swift
//  ShortClip
//
//  Created by Bassam Hillo on 03/04/2025.
//

import SwiftUI

struct TrendingModel {
    let image: ImageResource
    let tags: [String]
}

struct TrendingListView: View {
    let models: [TrendingModel]
    @Binding var selectedIndex: Int

    var body: some View {
        GeometryReader { proxy in
            TabView(selection: $selectedIndex) {
                ForEach(Array(models.enumerated()), id: \.offset) { index, model in
                    TrendingView(model: model)
                        .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
        }
        .aspectRatio(0.75, contentMode: .fit)
        .listRowBackground(Color.clear)
        .listRowSeparator(.hidden)
        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
    }
}

struct TrendingView: View {
    let model: TrendingModel

    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Image(model.image)
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(
                        width: proxy.size.width - 60,
                        height: proxy.size.width * 1.2
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 25))

                VStack(spacing: 10) {
                    Spacer()
                    tagsTextView
                    buttonsView
                }
                .frame(
                    width: proxy.size.width - 60,
                    height: proxy.size.width * 1.2
                )
            }
            .frame(maxWidth: .infinity)
            .aspectRatio(0.8, contentMode: .fit)
        }
    }

    private var tagsTextView: some View {
        Text(model.tags.joined(separator: " • "))
            .font(.system(size: 12, weight: .medium))
            .foregroundColor(.white)
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity)
    }

    private var buttonsView: some View {
        HStack(spacing: 10) {
            Button {
                // action
            } label: {
                Text("Play Now")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.black)
                    .padding(10)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(10)
            }
            Button {
                // action
            } label: {
                Text("+ Add to List")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                    .padding(10)
                    .frame(maxWidth: .infinity)
                    .background((Blur(style: .systemUltraThinMaterialDark)))
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white, lineWidth: 1)
                    }
            }
        }
        .padding(.bottom, 20)
        .padding(.horizontal, 20)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    DashboardView()
}
