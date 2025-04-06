//
//  HomeView.swift
//  ShortClip
//
//  Created by Bassam Hillo on 03/04/2025.
//

import SwiftUI

struct HomeView: View {

    enum Tab {
        case dashboard, reels
    }

    @State private var selectedTab: Tab = .dashboard

    var body: some View {
        TabView {
            DashboardView()
                .tabItem {
                    Image(systemName: "house")
                }
                .tag(Tab.dashboard)
            
            TrailersView()
                .tabItem {
                    Image(systemName: "play.square.stack")
                }
                .tag(Tab.reels)

            Text("Notifications")
                .tabItem {
                    Image(systemName: "bell")
                }
                .tag(Tab.dashboard)

            Text("Profile")
                .tabItem {
                    Image(systemName: "person")
                }
                .tag(Tab.dashboard)
        }
        .accentColor(.white)
    }
}

#Preview {
    HomeView()
}
