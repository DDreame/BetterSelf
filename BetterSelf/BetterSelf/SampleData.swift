//
//  SampleData.swift
//  BetterSelf
//
//  Created by DDreame on 2024/4/21.
//

import Foundation
import SwiftData

@MainActor
class SampleData {
    static let shared = SampleData()
    let modelContainer: ModelContainer
    
    var context: ModelContext {
        modelContainer.mainContext
    }
    
    private init() {
        let schema = Schema([
            UserModel.self,
            GoalModel.self,
            TaskModel.self
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
        let user = createSampleUser()
        context.insert(user)
        
        do {
            try context.save()
        } catch {
            print("Sample data context failed to save.")
        }
    }
    
    func createSampleUser() -> UserModel {
        let user = UserModel(name: "John Doe")
        
        // Create yearly goal
        let yearlyGoal = GoalModel(
            title: "Yearly Goal 2024",
            detail: "Achieve major milestones in 2024",
            goalType: .yearly,
            startDate: Date(),
            endDate: Calendar.current.date(byAdding: .year, value: 1, to: Date())!,
            priority: 1
        )
        
        // Create monthly goal
        let monthlyGoal = GoalModel(
            title: "Monthly Goal May 2024",
            detail: "Complete all tasks for May 2024",
            goalType: .monthly,
            startDate: Date(),
            endDate: Calendar.current.date(byAdding: .month, value: 1, to: Date())!,
            priority: 1
        )
        
        // Create weekly goal
        let weeklyGoal = GoalModel(
            title: "Weekly Goal Week 1",
            detail: "Complete all tasks for the first week",
            goalType: .weekly,
            startDate: Date(),
            endDate: Calendar.current.date(byAdding: .day, value: 7, to: Date())!,
            priority: 1
        )
        
        // Create tasks
        let task1 = TaskModel(
            title: "Task 1",
            detail: "Complete the first task",
            dueDate: Calendar.current.date(byAdding: .day, value: 2, to: Date()),
            priority: 1,
            priorityType: .importantUrgent,
            autoMoveToNextDay: true
        )
        
        let task2 = TaskModel(
            title: "Task 2",
            detail: "Complete the second task",
            dueDate: Calendar.current.date(byAdding: .day, value: 3, to: Date()),
            priority: 2,
            priorityType: .importantNotUrgent,
            autoMoveToNextDay: false
        )
        
        // Add tasks to weekly goal
        weeklyGoal.tasks.append(task1)
        weeklyGoal.tasks.append(task2)
        
        // Add weekly goal to monthly goal
        monthlyGoal.subGoals.append(weeklyGoal)
        
        // Add monthly goal to yearly goal
        yearlyGoal.subGoals.append(monthlyGoal)
        
        // Add yearly goal to user
        user.addYearlyGoal(yearlyGoal)
        
        // Add a standalone task to the user
        let standaloneTask = TaskModel(
            title: "Standalone Task",
            detail: "This is a standalone task",
            dueDate: Calendar.current.date(byAdding: .day, value: 5, to: Date()),
            priority: 3,
            priorityType: .notImportantNotUrgent,
            autoMoveToNextDay: true
        )
        user.tasks.append(standaloneTask)
        
        return user
    }
    
    var sampleUser: UserModel {
        createSampleUser()
    }
}

