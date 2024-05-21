//
//  WeeklyGoalsView.swift
//  BetterSelf
//
//  Created by DDreame on 2024/5/20.
//
import SwiftUI
import SwiftData

struct WeeklyGoalsView: View {
    @Environment(\.modelContext) private var modelContext;
    @Query private var user: [UserModel]

    var body: some View {
        NavigationView {
            VStack {
                Text("Weekly Goals")
                    .font(.largeTitle)
                    .padding()
                List {
                    ForEach(user[0].getYearlyGoals()) { yearlyGoal in
//                        ForEach(yearlyGoal.getSubGoals()) { monthlyGoal in
//                            ForEach(monthlyGoal.getSubGoals()) { weeklyGoal in
//                                Text(weeklyGoal.title)
//                            }
//                        }
                        Text(yearlyGoal.title)
                    }
                }
            }
            .navigationBarTitle("Weekly Goals", displayMode: .inline)
        }
    }
}

#Preview {
    WeeklyGoalsView()
        .modelContainer(SampleData.shared.modelContainer)
}
