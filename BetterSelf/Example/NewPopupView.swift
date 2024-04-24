//
//  NewPopupView.swift
//  BetterSelf
//
//  Created by DDreame on 2024/4/23.
//

import SwiftUI

struct NewPopupView: View {
    @State private var showBubbles = false
    @State private var showPartialView = false
    @State private var partialViewOffset = CGSize(width: -100, height: -100) // 初始位置调整至左上角
    @State private var dragAmount = CGSize.zero // 拖拽量

    var body: some View {
        ZStack {
            // 主视图内容
            Text("主页面内容")
                .blur(radius: showBubbles || showPartialView ? 3 : 0)
            
            // 底部导航栏
            VStack {
                Spacer()
                customTabBar
            }
            
            // 泡泡视图
            if showBubbles {
                bubblesView
                    .transition(.move(edge: .bottom))
            }
            
            // 左上角可拖拽视图
            if showPartialView {
                partialView
                    .offset(x: partialViewOffset.width + dragAmount.width, y: partialViewOffset.height + dragAmount.height)
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                self.dragAmount = gesture.translation
                            }
                            .onEnded { _ in
                                self.partialViewOffset.width += self.dragAmount.width
                                self.partialViewOffset.height += self.dragAmount.height
                                self.dragAmount = .zero // 拖拽结束后重置拖拽量
                            }
                    )
            }
        }
    }
    
    var customTabBar: some View {
        HStack {
            Button("首页") { }
            Spacer()
            Button("设置") { }
            Spacer()
            Button("弹出") {
                self.showBubbles.toggle()
            }
            Spacer()
            Button("更多") { }
            Spacer()
            Button("特殊") {
                self.showPartialView.toggle()
            }
        }
        .padding()
        .background(Color.gray.opacity(0.2))
    }
    
    var bubblesView: some View {
        VStack(spacing: 10) {
            ForEach(0..<4) { _ in
                Circle().fill(Color.random).frame(width: 50, height: 50)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
        .padding()
        .onTapGesture {
            self.showBubbles = false
        }
    }
    
    var partialView: some View {
        VStack {
            Text("可拖拽视图")
                .frame(width: 200, height: 200)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color.black.opacity(0.5))
        .onTapGesture {
            self.showPartialView = false
        }
    }
}

extension Color {
    static var random: Color {
        return Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#Preview {
    NewPopupView()
}
