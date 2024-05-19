//
//  Task.swift
//  BetterSelf
//
//  Created by DDreame on 2024/5/19.
//

import Foundation

enum TaskPriority {
    case importantUrgent
    case importantNotUrgent
    case notImportantUrgent
    case notImportantNotUrgent
}

// 任务（Task）是具体的行动项
// 任务可以转为 goal
class Task {
    var title: String
    var description: String?
    var isCompleted: Bool
    var dueDate: Date?
    var priority: Int // 数字优先级
    var priorityType: TaskPriority // 重要紧急优先级
    var autoMoveToNextDay: Bool // 自动移动到下一天
    var progress: Float // 任务进度，0.0 到 1.0 之间
    var subTasks: [Task] // 子任务列表

    init(title: String, description: String?, dueDate: Date?, priority: Int, priorityType: TaskPriority, autoMoveToNextDay: Bool, progress: Float = 0.0) {
        self.title = title
        self.description = description
        self.isCompleted = false
        self.dueDate = dueDate
        self.priority = priority
        self.priorityType = priorityType
        self.autoMoveToNextDay = autoMoveToNextDay
        self.progress = progress
        self.subTasks = []
    }

    func markAsCompleted() {
        isCompleted = true
        progress = 1.0
    }

    func moveToNextDay() {
        if autoMoveToNextDay {
            if let currentDueDate = dueDate {
                dueDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDueDate)
            }
        }
    }

    func updateProgress(_ newProgress: Float) {
        progress = newProgress
        if progress >= 1.0 {
            isCompleted = true
        }
    }

    func addSubTask(_ task: Task) {
        subTasks.append(task)
    }

    func getSubTasks() -> [Task] {
        return subTasks
    }

    func deleteTask() {
        // Implement deletion logic, e.g., removing from a list
    }
}
