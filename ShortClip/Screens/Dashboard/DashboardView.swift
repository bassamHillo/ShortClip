//
//  DashboardView.swift
//  ShortClip
//
//  Created by Bassam Hillo on 03/04/2025.
//

import SwiftUI

struct DashboardView: View {

    @State private var selectedTrendingIndex: Int = 0

    var body: some View {
        VStack(spacing: 0) {
            TopView()
            List {
                TrendingListView(
                    models: Samples.Dashboard.trendings,
                    selectedIndex: $selectedTrendingIndex
                )
                ContinueWatchSection(sections: Samples.Dashboard.continueWatchSectionItems)
                MostPopularSection(items: Samples.Dashboard.mostPopularSectionItems)

                ForEach(0 ..< Samples.Dashboard.sections.count, id: \.self) { item in
                    NewSeriesSection(model: Samples.Dashboard.sections[item])
                }
            }
            .listStyle(.grouped)
            .scrollIndicators(.hidden)
            .listSectionSpacing(20)
            .scrollContentBackground(.hidden)
        }
        .background(backgroundView)
    }

    private var backgroundView: some View {
        Image(Samples.Dashboard.trendings[selectedTrendingIndex].image)
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
            .blur(radius: 20)
            .overlay(Color.black.opacity(0.7))
            .transition(.opacity)
            .animation(.easeInOut(duration: 0.5), value: selectedTrendingIndex)
    }
}

#Preview {
    DashboardView()
}
