//
//  User.swift
//  BetterSelf
//
//  Created by DDreame on 2024/5/19.
//

import Foundation

class User {
    var name: String
    var yearlyGoals: [Goal]
    var tasks: [Task]

    init(name: String) {
        self.name = name
        self.yearlyGoals = []
        self.tasks = []
    }

    func addYearlyGoal(_ goal: Goal) {
        guard goal.goalType == .yearly else {
            print("Only yearly goals can be added at this level.")
            return
        }
        yearlyGoals.append(goal)
    }

    func addMonthlyGoal(toYearlyGoal yearlyGoal: Goal, monthlyGoal: Goal) {
        guard yearlyGoal.goalType == .yearly, monthlyGoal.goalType == .monthly else {
            print("Invalid goal types.")
            return
        }
        yearlyGoal.addSubGoal(monthlyGoal)
    }

    func addWeeklyGoal(toMonthlyGoal monthlyGoal: Goal, weeklyGoal: Goal) {
        guard monthlyGoal.goalType == .monthly, weeklyGoal.goalType == .weekly else {
            print("Invalid goal types.")
            return
        }
        monthlyGoal.addSubGoal(weeklyGoal)
    }

    func addTask(toGoal goal: Goal, task: Task) {
        if goal.goalType == .weekly {
            goal.addTask(task)
        } else {
            tasks.append(task)
        }
    }

    func getYearlyGoals() -> [Goal] {
        return yearlyGoals
    }

    func getTasks() -> [Task] {
        return tasks
    }

    func moveTasksToNextDay() {
        for task in tasks {
            task.moveToNextDay()
        }
        for yearlyGoal in yearlyGoals {
            for monthlyGoal in yearlyGoal.getSubGoals() {
                for weeklyGoal in monthlyGoal.getSubGoals() {
                    for task in weeklyGoal.getTasks() {
                        task.moveToNextDay()
                    }
                }
            }
        }
    }

    func getTasksSortedByPriority() -> [Task] {
        return tasks.sorted(by: { $0.priority < $1.priority })
    }

    func completeTask(_ task: Task) {
        task.markAsCompleted()
    }

    func updateTaskProgress(_ task: Task, newProgress: Float) {
        task.updateProgress(newProgress)
    }

    func deleteTask(_ task: Task) {
        tasks.removeAll { $0 === task }
    }
}
