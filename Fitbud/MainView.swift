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
    
    var body: some View {
        NavigationStack{
            TabView(selection: $selectedTab) {
                HomeView()
                .padding()
                .tabItem { Label("Home", systemImage: "house.fill") }.tag(1)
                
                WCalendarView().tabItem { Label("Calendar", systemImage: "calendar") }.tag(2)
                Text("Tab Content 3").tabItem { Label("Milestones", systemImage: "star") }.tag(3)
                Text("Tab Content 4").tabItem { Label("Settings", systemImage: "gear") }.tag(4)
            }
        }
        
    }
}

#Preview {
    MainView()
}
