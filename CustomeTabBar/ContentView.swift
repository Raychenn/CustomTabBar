//
//  ContentView.swift
//  CustomeTabBar
//
//  Created by Boray Chen on 2025/6/28.
//

import SwiftUI

struct ContentView: View {
    
    @State var currentTab: Tab = .home
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $currentTab) {
                Text("Home")
                    .tag(Tab.home)
                
                Text("Favorite")
                    .tag(Tab.favorite)
                
                Text("Search")
                    .tag(Tab.search)
                
                Text("Profile")
                    .tag(Tab.profile)
            }
        }
        .padding()
        
        CustomeTabBar(currentTab: $currentTab)
    }
}

#Preview {
    ContentView()
}
