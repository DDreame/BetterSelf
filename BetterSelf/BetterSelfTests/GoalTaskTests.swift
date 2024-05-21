//
//  GoalTaskTests.swift
//  BetterSelfTests
//
//  Created by DDreame on 2024/5/19.
//

import XCTest
@testable import BetterSelf
class GoalTaskTests: XCTestCase {

    func testTaskProgress() {
        let task = TaskModel(title: "Test Task", detail: "This is a test task", dueDate: nil, priority: 1, priorityType: .importantUrgent, autoMoveToNextDay: true)
        
        XCTAssertEqual(task.progress, 0.0)
        
        task.updateProgress(0.5)
        XCTAssertEqual(task.progress, 0.5)
        
        task.updateProgress(1.0)
        XCTAssertEqual(task.progress, 1.0)
        XCTAssertTrue(task.isCompleted)
    }

    func testTaskAutoMoveToNextDay() {
        let calendar = Calendar.current
        let today = Date()
        let tomorrow = calendar.date(byAdding: .day, value: 1, to: today)!
        
        var task = TaskModel(title: "Test Task", detail: "This is a test task", dueDate: today, priority: 1, priorityType: .importantUrgent, autoMoveToNextDay: true)
        
        task.moveToNextDay()
        XCTAssertEqual(task.dueDate, tomorrow)
        
        task = TaskModel(title: "Test Task", detail: "This is a test task", dueDate: today, priority: 1, priorityType: .importantUrgent, autoMoveToNextDay: false)
        
        task.moveToNextDay()
        XCTAssertEqual(task.dueDate, today)
    }

    func testAddSubTask() {
        let task = TaskModel(title: "Main Task", detail: "This is the main task", dueDate: nil, priority: 1, priorityType: .importantUrgent, autoMoveToNextDay: true)
        let subTask = TaskModel(title: "Sub Task", detail: "This is a sub task", dueDate: nil, priority: 2, priorityType: .importantNotUrgent, autoMoveToNextDay: true)
        
        task.addSubTask(subTask)
        
        XCTAssertEqual(task.subTasks.count, 1)
        XCTAssertEqual(task.subTasks[0].title, "Sub Task")
    }

    func testGoalHierarchy() {
        let yearlyGoal = GoalModel(title: "Yearly Goal", detail: "This is a yearly goal", goalType: .yearly, startDate: Date(), endDate: Date(), priority: 1)
        let monthlyGoal = GoalModel(title: "Monthly Goal", detail: "This is a monthly goal", goalType: .monthly, startDate: Date(), endDate: Date(), priority: 2)
        let weeklyGoal = GoalModel(title: "Weekly Goal", detail: "This is a weekly goal", goalType: .weekly, startDate: Date(), endDate: Date(), priority: 3)
        
        yearlyGoal.addSubGoal(monthlyGoal)
        monthlyGoal.addSubGoal(weeklyGoal)
        
        XCTAssertEqual(yearlyGoal.getSubGoals().count, 1)
        XCTAssertEqual(monthlyGoal.getSubGoals().count, 1)
        XCTAssertEqual(yearlyGoal.getSubGoals()[0].title, "Monthly Goal")
        XCTAssertEqual(monthlyGoal.getSubGoals()[0].title, "Weekly Goal")
    }

    func testUserTaskManagement() {
        let user = UserModel(name: "Test User")
        
        let task = TaskModel(title: "Independent Task", detail: "This is an independent task", dueDate: nil, priority: 1, priorityType: .importantUrgent, autoMoveToNextDay: true)
        
        user.addTask(toGoal: GoalModel(title: "", detail: nil, goalType: .weekly, startDate: Date(), endDate: Date(), priority: 0), task: task)
        user.tasks.append(task)
        
        XCTAssertEqual(user.getTasks().count, 1)
        XCTAssertEqual(user.getTasks()[0].title, "Independent Task")
        
        user.completeTask(task)
        XCTAssertTrue(user.getTasks()[0].isCompleted)
    }

    func testMoveTasksToNextDay() {
        let user = UserModel(name: "Test User")
        
        let task1 = TaskModel(title: "Task 1", detail: "This is task 1", dueDate: Date(), priority: 1, priorityType: .importantUrgent, autoMoveToNextDay: true)
        let task2 = TaskModel(title: "Task 2", detail: "This is task 2", dueDate: Date(), priority: 2, priorityType: .importantNotUrgent, autoMoveToNextDay: true)
        
        user.tasks.append(task1)
        user.tasks.append(task2)
        
        user.moveTasksToNextDay()
        
        let calendar = Calendar.current
        let tomorrow = calendar.date(byAdding: .day, value: 1, to: Date())!
        
        XCTAssertEqual(user.getTasks()[0].dueDate, tomorrow)
        XCTAssertEqual(user.getTasks()[1].dueDate, tomorrow)
    }
}

