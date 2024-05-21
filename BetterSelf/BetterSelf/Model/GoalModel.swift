//
//  Goal.swift
//  BetterSelf
//
//  Created by DDreame on 2024/5/19.
//
import Foundation
import SwiftData

enum GoalType: String, Codable {
    case yearly
    case monthly
    case weekly
}

@Model
class GoalModel {
    var id = UUID()
    var title: String
    var detail: String?
    var goalType: GoalType
    var startDate: Date
    var endDate: Date
    var subGoals: [GoalModel]
    var tasks: [TaskModel]
    var priority: Int

    init(title: String, detail: String?, goalType: GoalType, startDate: Date, endDate: Date, priority: Int) {
        self.title = title
        self.detail = detail
        self.goalType = goalType
        self.startDate = startDate
        self.endDate = endDate
        self.subGoals = []
        self.tasks = []
        self.priority = priority
    }

    // Codable conformance
    enum CodingKeys: String, CodingKey {
        case id, title, description, goalType, startDate, endDate, subGoals, tasks, priority
    }
   
}

