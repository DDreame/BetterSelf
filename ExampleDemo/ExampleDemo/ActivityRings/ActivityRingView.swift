//
//  ActivityRingView.swift
//  ExampleDemo
//  
//  Created by DDreame on 2024/5/19.
//

import HealthKit
import SwiftUI

struct ActivityRingView: View {
    @State private var activitySummary = HKActivitySummary()
    
    var body: some View {
        ZStack {
            RingActivity(activitySummary: $activitySummary)
                .onAppear {
                    postLoadData()
                }
        }
        .background(Color.black)
    }
    
    func postLoadData() {
        // Move: active enery burned / goal
        // Quantity unit must be energy, ie. calorie
        activitySummary.activeEnergyBurned = HKQuantity(unit: .largeCalorie(), doubleValue: 30)
        activitySummary.activeEnergyBurnedGoal = HKQuantity(unit: .largeCalorie(), doubleValue: 100)
        
        // Exercise: exercise time / goal
        // Quantity unit must be time (hour, minute, or second)
        activitySummary.appleExerciseTime = HKQuantity(unit: .minute(), doubleValue: 20)
        activitySummary.appleExerciseTimeGoal = HKQuantity(unit: .minute(), doubleValue: 30)
        
        
        // Stand: hours time / goal
        // Quantity unit must be count
        activitySummary.appleStandHours = HKQuantity(unit: .count(), doubleValue: 1)
        activitySummary.appleStandHoursGoal = HKQuantity(unit: .count(), doubleValue: 9)
    }
}

#Preview {
    ActivityRingView()
}
