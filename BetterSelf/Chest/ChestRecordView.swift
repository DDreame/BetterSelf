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
    @Query(sort: \ChestList.timestamp) private var allChests: [ChestList]
    @State private var newList: ChestList?
    var natitle: String = ""
    var type: String = "Chest"
    
    var body: some View {
        NavigationSplitView {
            Group{
                if allChests.isEmpty{
                    ContentUnavailableView {
                        Label("No Fitness Log", systemImage: "film.stack")
                    }
                }
                else{
                    List {
                        ForEach(allChests.filter { $0.fitType == self.type }) { chestList in
                            NavigationLink {
                                ChestListView(chestList: chestList)
                            } label: {
                                Text("\(chestList.fitType) at \(chestList.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }
                    .navigationTitle(natitle)
        #if os(macOS)
                    .navigationSplitViewColumnWidth(min: 180, ideal: 200)
        #endif
                    .toolbar {
//        #if os(iOS)
//                        ToolbarItem(placement: .navigationBarTrailing) {
//                            EditButton()
//                        }
//        #endif
                        ToolbarItem {
                            Button(action: addItem) {
                                Label("Add Item", systemImage: "plus")
                            }
                        }
                        
                        
                        ToolbarItem(placement: .cancellationAction) {
                            Button(action: addItem) {
                                Label("Add Item", systemImage: "gear")
                            }
                        }
                    }
                    .sheet(item: $newList) { chestlist in
                        NavigationStack {
                            ChestListView(chestList: chestlist, isEdit: true)
                        }
                        //  取消下拉 - 防止未保存
                        .interactiveDismissDisabled()
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
            let newItem = ChestList(chestList: [ChestSingle(index: 0, fitType: "卧推", strength: "15kg", times: 10, groups: 4)], timestamp:.now, fitType: self.type)
            modelContext.insert(newItem)
            newList = newItem
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
    ChestRecordView()
        .modelContainer(SampleData.shared.modelContainer)
}
