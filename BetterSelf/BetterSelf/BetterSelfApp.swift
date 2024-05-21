//
//  BetterSelfApp.swift
//  BetterSelf
//
//  Created by DDreame on 2024/4/21.
//

import SwiftUI
import SwiftData

@main
struct BetterSelfApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            UserModel.self,
            GoalModel.self,
            TaskModel.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
