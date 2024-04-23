//
//  AppSettingView.swift
//  BetterSelf
//  TODO: Section1 调整顺序、主要类别管理
//  TODO: Section2 动作管理
//  TODO: Section3 icloud 数据同步打开
//  Created by DDreame on 2024/4/22.
//

import SwiftUI

struct SettingItem: Identifiable, Equatable {
    let id = UUID()
    var name: String
}


struct SettingView: View {
    // 分类后的设置项
   @State private var settings: [[SettingItem]] = [
       [SettingItem(name: "Wi-Fi"), SettingItem(name: "Bluetooth")],
       [SettingItem(name: "Notifications"), SettingItem(name: "Sounds"), SettingItem(name: "Focus")],
       [SettingItem(name: "General"), SettingItem(name: "Control Center")]
   ]
   
   var body: some View {
       NavigationView {
           List {
               ForEach($settings.indices, id: \.self) { sectionIndex in
                   Section {
                       ForEach($settings[sectionIndex]) { $item in
                           NavigationLink(destination: DetailView(item: $item)) {
                               Text(item.name)
                           }
                       }
                       .onMove { indices, newOffset in
                           settings[sectionIndex].move(fromOffsets: indices, toOffset: newOffset)
                       }
                   } header: {
                       Text("Section \(sectionIndex + 1)")
                   }
               }
           }
           .navigationTitle("Settings")
           .toolbar {
               EditButton()
           }
       }
   }
}

// 详情视图
struct DetailView: View {
    @Binding var item: SettingItem
    
    var body: some View {
        Text("Settings for \(item.name)")
    }
}

#Preview {
    SettingView()
}
