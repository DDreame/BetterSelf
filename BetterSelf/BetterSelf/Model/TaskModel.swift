//
//  Task.swift
//  BetterSelf
//
//  Created by DDreame on 2024/5/19.
//
import Foundation
import SwiftData

enum TaskPriority: String, Codable {
    case importantUrgent
    case importantNotUrgent
    case notImportantUrgent
    case notImportantNotUrgent
}

@Model
class TaskModel {
    var id = UUID()
    var title: String
    var detail: String?
    var isCompleted: Bool
    var dueDate: Date?
    var priority: Int
    var priorityType: TaskPriority
    var autoMoveToNextDay: Bool
    var progress: Float
    var subTasks: [TaskModel]

    init(title: String, detail: String?, dueDate: Date?, priority: Int, priorityType: TaskPriority, autoMoveToNextDay: Bool, progress: Float = 0.0) {
        self.title = title
        self.detail = detail
        self.isCompleted = false
        self.dueDate = dueDate
        self.priority = priority
        self.priorityType = priorityType
        self.autoMoveToNextDay = autoMoveToNextDay
        self.progress = progress
        self.subTasks = []
    }
}
