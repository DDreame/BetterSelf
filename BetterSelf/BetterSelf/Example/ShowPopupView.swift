//
//  ShowPopupView.swift
//  BetterSelf
//
//  Created by DDreame on 2024/4/23.
//

import SwiftUI

struct ShowPopupView: View {
    @State private var showPopup = false  // 控制弹出层的显示

    var body: some View {
        TabView {
            Text("首页").tabItem {
                Label("首页", systemImage: "house")
            }

            Text("设置").tabItem {
                Label("设置", systemImage: "gear")
            }

            Button(action: {
                withAnimation {
                    self.showPopup.toggle()
                }
            }) {
                Image(systemName: "plus.circle.fill")
                    .font(.system(size: 50))
            }
            .tabItem { Text("") }
            .buttonStyle(PlainButtonStyle())  // 取消按钮样式

            Text("消息").tabItem {
                Label("消息", systemImage: "message")
            }

            Text("我的").tabItem {
                Label("我的", systemImage: "person")
            }
        }
        .overlay(
            // 如果showPopup为true，则显示弹出层
            PopupView(showPopup: $showPopup)
                .animation(.easeInOut, value: showPopup)
        )
    }
}

#Preview {
    ShowPopupView()
}
