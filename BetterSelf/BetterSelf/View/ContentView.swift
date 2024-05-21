//
//  ContentView.swift
//  BetterSelf
//
//  Created by DDreame on 2024/4/22.
//

import Foundation
import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext;
    @Query private var _user: [UserModel]

    var body: some View {
        TabView {
            YearlyGoalsView()
                .tabItem {
                    Label("Yearly Goals", systemImage: "calendar")
                }

            MonthlyGoalsView()
                .tabItem {
                    Label("Monthly Goals", systemImage: "calendar.circle")
                }

            WeeklyGoalsView()
                .tabItem {
                    Label("Weekly Goals", systemImage: "calendar.badge.clock")
                }

            ToDoListView()
                .tabItem {
                    Label("To-Do List", systemImage: "checklist")
                }
        }
    }
}




#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}
