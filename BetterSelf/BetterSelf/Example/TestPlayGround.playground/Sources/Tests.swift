//
//  Tests.swift
//  BetterSelf
//
//  Created by DDreame on 2024/5/19.
//

import Foundation

class TaskTests {
    func runTests() {
        testTaskCreation()
        testTaskNesting()
        testTaskCompletion()
        testTaskProgress()
        testTaskMoveToNextDay()
    }

    func testTaskCreation() {
        let task = Task(title: "Main Task", description: "This is a main task", dueDate: Date(), priority: 1, priorityType: .importantUrgent, autoMoveToNextDay: true)
        assert(task.title == "Main Task")
        assert(task.description == "This is a main task")
        assert(task.priority == 1)
        print("testTaskCreation passed")
    }

    func testTaskNesting() {
        let parentTask = Task(title: "Parent Task", description: "This is a parent task", dueDate: Date(), priority: 1, priorityType: .importantUrgent, autoMoveToNextDay: true)
        let childTask = Task(title: "Child Task", description: "This is a child task", dueDate: Date(), priority: 2, priorityType: .importantNotUrgent, autoMoveToNextDay: true)
        parentTask.addSubTask(childTask)
        assert(parentTask.subTasks.count == 1)
        assert(parentTask.subTasks[0].title == "Child Task")
        print("testTaskNesting passed")
    }

    func testTaskCompletion() {
        let task = Task(title: "Task to Complete", description: "Complete this task", dueDate: Date(), priority: 1, priorityType: .importantUrgent, autoMoveToNextDay: true)
        task.markAsCompleted()
        assert(task.isCompleted == true)
        assert(task.progress == 1.0)
        print("testTaskCompletion passed")
    }

    func testTaskProgress() {
        let task = Task(title: "Task with Progress", description: "Track progress of this task", dueDate: Date(), priority: 1, priorityType: .importantUrgent, autoMoveToNextDay: true)
        task.updateProgress(0.5)
        assert(task.progress == 0.5)
        assert(task.isCompleted == false)
        task.updateProgress(1.0)
        assert(task.progress == 1.0)
        assert(task.isCompleted == true)
        print("testTaskProgress passed")
    }

    func testTaskMoveToNextDay() {
        let calendar = Calendar.current
        let today = Date()
        var dateComponents = DateComponents()
        dateComponents.day = 1
        let tomorrow = calendar.date(byAdding: dateComponents, to: today)
        
        let task = Task(title: "Task to Move", description: "This task will move to next day", dueDate: today, priority: 1, priorityType: .importantUrgent, autoMoveToNextDay: true)
        task.moveToNextDay()
        assert(calendar.isDate(task.dueDate!, inSameDayAs: tomorrow!))
        print("testTaskMoveToNextDay passed")
    }
}

let taskTests = TaskTests()
taskTests.runTests()
