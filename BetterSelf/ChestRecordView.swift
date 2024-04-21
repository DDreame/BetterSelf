//
//  ChestRecord.swift
//  BetterSelf
//
//  Created by DDreame on 2024/4/21.
//


import SwiftUI
import SwiftData

struct ChestRecordView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var allChests: [ChestList]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(allChests) { chestList in
                    NavigationLink {
                        Text("Item at \(chestList.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        ChestListView(_chests: chestList)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle("1aa")
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
            let newItem = [ChestSingle(fitType: "卧推", strength: "15kg", times: 10, groups: 4)]
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(allChests[index])
            }
        }
    }
}

#Preview {
    ChestListView()
        .modelContainer(for: ChestSingle.self, inMemory: true)
}
