//
//  ContentView.swift
//  mantraLog
//
//  Created by Gaura Klein on 9/18/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationStack {
                HomeView()
            }
            .tabItem {
                Label("Log", systemImage: "calendar")
            }
            
            NavigationStack {
                CounterView()
            }
            .tabItem {
                Label("Counter", systemImage: "apple.meditate")
            }

            NavigationStack {
                SettingsView()
            }
            .tabItem {
                Label("Settings", systemImage: "gearshape.fill")
            }
            
            
        }
    }
}

// Example screens
struct HomeView: View {
    var body: some View {
        VStack {
            Text("Home Screen")
                .font(.largeTitle)
            NavigationLink("Go to Details", destination: DetailView())
                .padding()
        }
    }
}

struct SettingsView: View {
    var body: some View {
        Text("Settings Screen")
    }
}

struct DetailView: View {
    var body: some View {
        Text("Detail Screen")
    }
}

struct CounterView: View {
    var body: some View {
        Text("Counter Screen")
    }
}

#Preview {
    ContentView()
}
