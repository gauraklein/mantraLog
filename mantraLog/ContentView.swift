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
                LogView()
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
struct SettingsView: View {
    var body: some View {
        Text("Settings Screen")
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
