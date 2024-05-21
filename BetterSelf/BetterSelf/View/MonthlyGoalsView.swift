//
//  MonthlyGoalsView.swift
//  BetterSelf
//
//  Created by DDreame on 2024/5/20.
//
import SwiftUI
import SwiftData

struct MonthlyGoalsView: View {
    @Environment(\.modelContext) private var modelContext;
    @Query private var user: [UserModel]

    var body: some View {
        NavigationView {
            VStack {
                Text("Monthly Goals")
                    .font(.largeTitle)
                    .padding()
                List {
                    ForEach(user[0].getYearlyGoals()) { yearlyGoal in
//                        ForEach(yearlyGoal.getSubGoals()) { monthlyGoal in
//                            Text(monthlyGoal.title)
//                        }
                        Text(yearlyGoal.title)
                    }
                }
            }
            .navigationBarTitle("Monthly Goals", displayMode: .inline)
        }
    }
}

#Preview {
    MonthlyGoalsView()
        .modelContainer(SampleData.shared.modelContainer)
}
