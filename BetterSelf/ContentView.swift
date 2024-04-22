//
//  ContentView.swift
//  BetterSelf
//
//  Created by DDreame on 2024/4/22.
//

import Foundation
import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 1
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ChestRecordView(natitle:"Chest Workout", type:"Chest")
                .tabItem {
                    Label("Chest", systemImage: "film.stack")
                }
                .tag(1)
                .transition(.opacity)
            ChestRecordView(natitle:"Back Workout", type:"Back")
                .tabItem {
                    Label("Back", systemImage: "dial.fill")
                }
                .tag(2)
                .transition(.opacity)
            CreateView(chestList: SampleData.shared.chests)
                .tabItem {
                    Label("Create", systemImage: "plus")
                }
                .tag(3)
                .transition(.opacity)
            ChestRecordView(natitle:"Leg Workout",
                            type:"Leg")
                .tabItem {
                    Label("Leg", systemImage: "face.smiling")
                }
                .tag(4)
                .transition(.opacity)
            ChestRecordView(natitle:"Shoulder Workout",
                            type:"Shoulder")
                .tabItem {
                    Label("Shoulder", systemImage: "line.horizontal.3.circle")
                }
                .tag(5)
                .transition(.opacity)
        }
//        #if os(iOS)
//        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // 可选，为了更好的展示效果，隐藏系统的指示器
//        #endif
        .animation(.easeInOut, value: selectedTab) // 应用动画效果
        
    }
    
    
}



#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}
