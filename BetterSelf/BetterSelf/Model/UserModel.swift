//
//  User.swift
//  BetterSelf
//
//  Created by DDreame on 2024/5/19.
//
import Foundation
import SwiftData

@Model
class UserModel {
     var name: String
     var yearlyGoals: [GoalModel]
     var tasks: [TaskModel]

    init(name: String) {
        self.name = name
        self.yearlyGoals = []
        self.tasks = []
    }

    func addYearlyGoal(_ goal: GoalModel) {
        guard goal.goalType == .yearly else {
            print("Only yearly goals can be added at this level.")
            return
        }
        yearlyGoals.append(goal)
    }

    func addMonthlyGoal(toYearlyGoal yearlyGoal: GoalModel, monthlyGoal: GoalModel) {
        guard yearlyGoal.goalType == .yearly, monthlyGoal.goalType == .monthly else {
            print("Invalid goal types.")
            return
        }
        yearlyGoal.subGoals.append(monthlyGoal)
    }

    func addWeeklyGoal(toMonthlyGoal monthlyGoal: GoalModel, weeklyGoal: GoalModel) {
        guard monthlyGoal.goalType == .monthly, weeklyGoal.goalType == .weekly else {
            print("Invalid goal types.")
            return
        }
        monthlyGoal.subGoals.append(weeklyGoal)
    }

    func addTask(toGoal goal: GoalModel, task: TaskModel) {
        if goal.goalType == .weekly {
            goal.tasks.append(task)
        } else {
            tasks.append(task)
        }
    }

    func getYearlyGoals() -> [GoalModel] {
        return yearlyGoals
    }

    func getTasks() -> [TaskModel] {
        return tasks
    }

    func moveTasksToNextDay() {
        for task in tasks {
            if task.autoMoveToNextDay {
                task.dueDate = Calendar.current.date(byAdding: .day, value: 1, to: task.dueDate ?? Date())
            }
        }
        for yearlyGoal in yearlyGoals {
            for monthlyGoal in yearlyGoal.subGoals {
                for weeklyGoal in monthlyGoal.subGoals {
                    for task in weeklyGoal.tasks {
                        if task.autoMoveToNextDay {
                            task.dueDate = Calendar.current.date(byAdding: .day, value: 1, to: task.dueDate ?? Date())
                        }
                    }
                }
            }
        }
    }

    func getTasksSortedByPriority() -> [TaskModel] {
        return tasks.sorted(by: { $0.priority < $1.priority })
    }

    func completeTask(_ task: TaskModel) {
        task.isCompleted = true
    }

    func updateTaskProgress(_ task: TaskModel, newProgress: Float) {
        task.progress = newProgress
    }

    func deleteTask(_ task: TaskModel) {
        tasks.removeAll { $0 === task }
    }
    
//    // Demo Data 
//    static let sampleData = [
//        Movie(title: "Amusing Space Traveler 3",
//              releaseDate: Date(timeIntervalSinceReferenceDate: -402_000_000)),
//    ]
}
