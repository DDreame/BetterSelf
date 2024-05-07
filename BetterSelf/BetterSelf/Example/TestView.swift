//
//  TestView.swift
//  BetterSelf
//
//  Created by DDreame on 2024/4/23.
//

import SwiftUI

import SwiftUI

struct TestView: View {
    @State private var showBubbles = false
    @State private var showPartialView = false
    @State private var partialViewWidth: CGFloat = 100 // 初始宽度为屏幕宽度的五分之一或十分之一
    @State private var partialViewOffset = CGSize.zero

    var body: some View {
        GeometryReader { geometry in
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
                        .frame(width: partialViewWidth, height: geometry.size.height / 2)
                        .offset(x: partialViewOffset.width, y: partialViewOffset.height)
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    let dragOffset = gesture.translation.width
                                    self.partialViewOffset = CGSize(width: max(0, dragOffset), height: -100)
                                    
                                    // 根据拖拽距离调整视图宽度
                                    let newWidth = 100 + dragOffset
                                    self.partialViewWidth = min(max(newWidth, 100), geometry.size.width / 2)
                                }
                                .onEnded { _ in
                                    // 如果拖拽超过屏幕宽度的一定比例，则展开视图
                                    if self.partialViewWidth > geometry.size.width / 4 {
                                        self.partialViewWidth = geometry.size.width / 2
                                        self.partialViewOffset = CGSize(width: 0, height: -100)
                                    } else {
                                        // 否则，缩回去
                                        //self.showPartialView = false
                                    }
                                }
                        )
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
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
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 5)
            Spacer()
        }
        .background(Color.black.opacity(0.5))
//        .onTapGesture {
//            self.showPartialView = false
//        }
    }
}

#Preview {
    TestView()
}
