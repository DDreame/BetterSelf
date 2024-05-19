//
//  Goal.swift
//  BetterSelf
//
//  Created by DDreame on 2024/5/19.
//

import Foundation

enum GoalType {
    case yearly
    case monthly
    case weekly
}

// 目标（Goal）通常是长期或中期的规划，可以包含子目标和任务
class Goal {
    var title: String
    var description: String?
    var goalType: GoalType
    var startDate: Date
    var endDate: Date
    var subGoals: [Goal]
    var tasks: [Task] // 新增
    var priority: Int // 数字优先级

    init(title: String, description: String?, goalType: GoalType, startDate: Date, endDate: Date, priority: Int) {
        self.title = title
        self.description = description
        self.goalType = goalType
        self.startDate = startDate
        self.endDate = endDate
        self.subGoals = []
        self.tasks = [] // 初始化
        self.priority = priority
    }

    func addSubGoal(_ goal: Goal) {
        switch (self.goalType, goal.goalType) {
        case (.yearly, .monthly), (.monthly, .weekly):
            subGoals.append(goal)
        default:
            print("Invalid sub-goal type. Yearly goals can only have monthly sub-goals, and monthly goals can only have weekly sub-goals.")
        }
    }

    func addTask(_ task: Task) {
        if self.goalType == .weekly {
            tasks.append(task)
        } else {
            print("Tasks can only be added to weekly goals.")
        }
    }

    func getSubGoals() -> [Goal] {
        return subGoals
    }

    func getTasks() -> [Task] { // 新增
        return tasks
    }
}
