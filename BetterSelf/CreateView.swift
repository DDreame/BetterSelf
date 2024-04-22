//
//  CreateView.swift
//  BetterSelf
//
//  Created by DDreame on 2024/4/22.
//

import SwiftUI

struct CreateView: View {
    @Bindable var chestList: ChestList
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                ForEach(["Chest", "Back", "Leg", "Shoulder"], id: \.self) { item in
                    CardView(chestList:chestList, title: item)
                }
                Spacer()
            }
            #if os(iOS)
            .navigationBarTitle("Create", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Cancel")
            })
            #endif
        }
    }
}

struct CardView: View {
    @Bindable var chestList: ChestList
    var title: String
    
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        NavigationLink(destination: ChestListView(chestList:chestList, isEdit: true)){
           
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.blue)
                    .frame(height: 100)
                    .shadow(radius: 5)
                Text(title)
                    .font(.title)
                    .foregroundColor(.white)
            }
            .padding(.horizontal)
            .buttonStyle(PlainButtonStyle()) // 移除默认的边框和背景色
        }
    }
}

#Preview {
    NavigationStack {
        CreateView(chestList: SampleData.shared.chests)
    }
}
