//
//  ContentView.swift
//  BetterSelf
//
//  Created by DDreame on 2024/4/21.
//

import SwiftUI
import SwiftData

struct ChestListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var chests: [ChestSingle]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(chests) { chest in
                    NavigationLink {
                        Text(chest.fitType)
                            .navigationTitle(chest.fitType)
                    } label: {
                        Text(chest.fitType)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle("Chest")
#if os(macOS)
            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
#endif
            .toolbar {
#if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
#endif
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an Fitness")
                .navigationTitle("aaa")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = ChestSingle(fitType: "卧推", strength: "15kg", times: 10, groups: 4)
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(chests[index])
            }
        }
    }
}

#Preview {
    ChestListView()
        .modelContainer(for: ChestSingle.self, inMemory: true)
}
