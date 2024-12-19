//
//  MainView.swift
//  Fitbud
//
//  Created by Joshua Lai on 10/15/24.
//

import SwiftUI


struct MainView: View {
    @State private var selectedTab = 1
    @Environment(\.presentationMode) var presentationMode
    @State private var showWorkoutView = false
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
        UITabBar.appearance().unselectedItemTintColor = UIColor.lightGray
        UITabBar.appearance().tintColor = UIColor.white 
    }
    
    var body: some View {
        NavigationStack{
            TabView(selection: $selectedTab) {
                HomeView()
                .padding()
                .tabItem { Label("Home", systemImage: "house.fill") }.tag(1)
                
                WCalendarView().tabItem { Label("Calendar", systemImage: "calendar") }.tag(2)
                MilestonesView().tabItem { Label("Milestones", systemImage: "star") }.tag(3)
                MetricsView().tabItem { Label("Metrics", systemImage: "rectangle.split.2x2") }.tag(4)
            }
        }
        
    }
}

#Preview {
    MainView()
}
