//
//  ChestListOneView.swift
//  BetterSelf
//
//  Created by DDreame on 2024/4/22.
//

import Foundation
import SwiftUI

struct ChestListView: View{
    
    @Bindable var chestList: ChestList
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    @State var isEdit = false
    let options = ["Option 1", "Option 2", "Option 3", "Option 4"]
    
    var body: some View {
          Form {
              DatePicker("Release date", selection: $chestList.timestamp, displayedComponents: .date)
              
              List(chestList.chestList) { chest in
                  
                  ChestView(chest: chest, isEdit: isEdit)
              }
              Spacer()
            
          }
          .navigationTitle(isEdit ? "Edit Fitness" : "Chest Fitness")
          .toolbar{
              if isEdit {
                  ToolbarItem(placement: .confirmationAction){
                      Button("Done"){
                          dismiss()
                      }
                  }
                  ToolbarItem(placement: .cancellationAction){
                      Button("CanCel"){
                          
                          dismiss()
                      }
                  }
              }
              else{
                  ToolbarItem(placement: .confirmationAction){
                      Button("Edit"){
                          
                          dismiss()
                      }
                  }
              }
             
          }
      }
}


#Preview {
    NavigationStack {
        ChestListView(chestList: SampleData.shared.chests)
    }
}

#Preview("Edit Fitness") {
    NavigationStack {
        ChestListView(chestList: SampleData.shared.chests, isEdit: true)
#if os(iOS)
            .navigationBarTitleDisplayMode(.inline)
#endif
    }
}


