//
//  MainTabView.swift
//  main-app
//
//  Created by Chi Zhuang Yan on 19/4/25.
//

import SwiftUI
import Profile

struct MainTabView: View {
    @State private var selectedTab = 0
        
        var body: some View {
            TabView(selection: $selectedTab) {
                Text("Dashboard")
                    .tabItem {
                        Label("Dashboard", systemImage: "chart.bar.fill")
                    }
                    .tag(0)
                
                VStack {
                    Text("Services")
                    ProfileText()
                }
                    .tabItem {
                        Label("Services", systemImage: "list.bullet")
                    }
                    .tag(1)
                
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.fill")
                    }
                    .tag(2)
            }
        }
}

#Preview {
    MainTabView()
}
