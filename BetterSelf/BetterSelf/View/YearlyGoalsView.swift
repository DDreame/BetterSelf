//
//  YearlyGoalsView.swift
//  BetterSelf
//
//  Created by DDreame on 2024/5/20.
//

import SwiftUI
import SwiftData

struct YearlyGoalsView: View {
    @Environment(\.modelContext) private var modelContext;
    @Query private var user: [UserModel]

    var body: some View {
        NavigationView {
            VStack {
                Text("Yearly Goals")
                    .font(.largeTitle)
                    .padding()
                List(user[0].getYearlyGoals()) { goal in
                    Text(goal.title)
                }
            }
            .navigationBarTitle("Yearly Goals", displayMode: .inline)
        }
    }
}

#Preview {
    YearlyGoalsView()
        .modelContainer(SampleData.shared.modelContainer)
}
