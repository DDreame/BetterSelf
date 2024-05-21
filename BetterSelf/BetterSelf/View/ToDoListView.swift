//
//  ToDoListView.swift
//  BetterSelf
//
//  Created by DDreame on 2024/5/20.
//
import SwiftUI
import SwiftData

struct ToDoListView: View {
    @Environment(\.modelContext) private var modelContext;
    @Query private var user: [UserModel]
    @State private var showAddTaskView = false

    var body: some View {
        NavigationView {
            VStack {
                Text("To-Do List")
                    .font(.largeTitle)
                    .padding()
                List {
                    ForEach(user[0].getTasks()) { task in
                        Text(task.title)
                    }
                }
            }
            .navigationBarTitle("To-Do List", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        showAddTaskView.toggle()
                    }) {
                        Image(systemName: "plus")
                            .font(.title)
                    }
                }
            }
            .sheet(isPresented: $showAddTaskView) {
                AddTaskView(showAddTaskView: $showAddTaskView)
            }
        }
    }
}


#Preview {
    ToDoListView()
        .modelContainer(SampleData.shared.modelContainer)
}
