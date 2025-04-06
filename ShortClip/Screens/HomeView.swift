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
                    Image(.home)
                }
                .tag(Tab.dashboard)
            
            TrailersView()
                .tabItem {
                    Image(.playlist)
                }
                .tag(Tab.reels)

            Text("Notifications")
                .tabItem {
                    Image(.notification)
                }
                .tag(Tab.dashboard)

            Text("Profile")
                .tabItem {
                    Image(.user)
                }
                .tag(Tab.dashboard)
        }
        .accentColor(.white)
    }
}

#Preview {
    HomeView()
}
