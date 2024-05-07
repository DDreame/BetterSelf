//
//  NewContentView.swift
//  BetterSelf
//
//  Created by DDreame on 2024/4/23.
//

import SwiftUI

struct NewContentView: View {
    @State private var showPopup = false
    @State private var showPartialPage = false
    @State private var pageOffset = CGSize(width: 300, height: -300) // 初始位置

    var body: some View {
        ZStack {
            TabView {
                // 前四个Tab的内容
                Text("首页").tabItem { Image(systemName: "house") }
                Text("搜索").tabItem { Image(systemName: "magnifyingglass") }
                Text("通知").tabItem { Image(systemName: "bell") }
                Text("设置").tabItem { Image(systemName: "gear") }
                
                // 第五个Tab，点击时显示泡泡和页面
                Button(action: {
                    withAnimation {
                        showPopup = true
                    }
                }) {
                    Image(systemName: "plus")
                }
                .tabItem { Image(systemName: "plus") }
            }
            
            if showPopup {
                // 背景虚化
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        withAnimation {
                            showPopup = false
                        }
                    }
                
                // 泡泡布局
                // 这里只是一个简单的示例，您可以根据需要自定义
                VStack {
                        BubbleView()
                        BubbleView()
                        BubbleView()
                        BubbleView()
                    
                }
                .transition(.scale)
                
                // 可拖拽的页面预览
                PartialPageView()
                    .offset(pageOffset)
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                self.pageOffset = gesture.translation
                            }
                            .onEnded { _ in
                                if self.pageOffset.height > -100 { // 拖拽到一定程度时展开
                                    self.pageOffset = CGSize(width: 0, height: 0)
                                } else { // 否则回到初始位置
                                    self.pageOffset = CGSize(width: 300, height: -300)
                                }
                            }
                    )
                    .transition(.move(edge: .top))
            }
        }
    }
}

struct BubbleView: View {
    var body: some View {
        Circle()
            .frame(width: 60, height: 60)
            .foregroundColor(.blue)
            .padding()
    }
}

struct PartialPageView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .frame(width: 300, height: 600)
            .foregroundColor(.white)
    }
}


#Preview {
    NewContentView()
}
