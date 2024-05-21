//
//  AddTaskView.swift
//  BetterSelf
//
//  Created by DDreame on 2024/5/20.
//
import SwiftUI
import SwiftData

struct AddTaskView: View {
    @Environment(\.modelContext) private var modelContext;
    @Query private var user: [UserModel]
    @Binding var showAddTaskView: Bool
    @State private var taskTitle = ""
    @State private var taskDescription = ""
    @State private var taskPriority = 1
    @State private var selectedPriorityType = TaskPriority.importantUrgent

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Task Info")) {
                    TextField("Title", text: $taskTitle)
                    TextField("Description", text: $taskDescription)
                    Picker("Priority", selection: $taskPriority) {
                        ForEach(1..<6) {
                            Text("\($0)")
                        }
                    }
                    Picker("Priority Type", selection: $selectedPriorityType) {
                        Text("Important & Urgent").tag(TaskPriority.importantUrgent)
                        Text("Important & Not Urgent").tag(TaskPriority.importantNotUrgent)
                        Text("Not Important & Urgent").tag(TaskPriority.notImportantUrgent)
                        Text("Not Important & Not Urgent").tag(TaskPriority.notImportantNotUrgent)
                    }
                }
            }
            .navigationBarTitle("Add Task", displayMode: .inline)
            .navigationBarItems(leading: Button("Cancel") {
                showAddTaskView = false
            }, trailing: Button("Save") {
                let newTask = TaskModel(title: taskTitle, detail: taskDescription, dueDate: nil, priority: taskPriority, priorityType: selectedPriorityType, autoMoveToNextDay: false)
                user[0].tasks.append(newTask)
                showAddTaskView = false
            })
        }
    }
}

#Preview {
    AddTaskView(showAddTaskView: .constant(true))
        .modelContainer(SampleData.shared.modelContainer)
}
