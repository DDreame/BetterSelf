//
//  SampleData.swift
//  BetterSelf
//
//  Created by DDreame on 2024/4/21.
//

import Foundation
import SwiftData

@MainActor
class SampleData{
    static let shared = SampleData()
    let modelContainer: ModelContainer
    
    var context: ModelContext{
        modelContainer.mainContext;
    }
    
    private init(){
        let schema = Schema([
            ChestSingle.self,
            ChestList.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        do {
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            insertSampleData()
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    
    func insertSampleData() {
        for chestSingle in ChestSingle.sampleData {
            context.insert(chestSingle)
        }
        do{
            try context.save()
        } catch{
            print("Sample data context failed to save.")
        }
    }
}
