//
//  RudderNavigation.swift
//  BetterSelf
//
//  Created by DDreame on 2024/4/23.
//

import SwiftUI


struct RudderNavigation: View {
    @State private var selectedTab = 0
    // 定义每个按钮的缩放状态
    @State private var scaleValues = [1.0, 1.0, 1.0, 1.0, 1.0]
     
     var body: some View {
         VStack(spacing: 0) {
             // 主内容区域
             ZStack {
                 switch selectedTab {
                 case 0:
                     Text("Test")
                 case 1:
                     Text("搜索")
                 case 2:
                     Text("发布")
                 case 3:
                     Text("消息")
                 case 4:
                     Text("我的")
                 default:
                     Text("首页")
                 }
             }
             
             Spacer()
             // 自定义的底部导航栏
             HStack {
                 // 首页
                 Button(action: {
                    // 按钮点击时的动作
                     withAnimation(.easeInOut(duration: 0.5)) {
                         self.scaleValues[0] = 1.5 // 放大
                         DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                             self.scaleValues[0] = 1.0 // 恢复原始大小
                         }
                     }
                     self.selectedTab = 0
                 }) {
                     Image(systemName: "house.fill")
                         .font(.system(size: 30))
                         .scaleEffect(scaleValues[0])
                 }
                 Spacer()
                 // 搜索
                 Button(action: {
                     // 按钮点击时的动作
                      withAnimation(.easeInOut(duration: 0.5)) {
                          self.scaleValues[1] = 1.5 // 放大
                          DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                              self.scaleValues[1] = 1.0 // 恢复原始大小
                          }
                      }
                      self.selectedTab = 1
                  }) {
                     Image(systemName: "magnifyingglass")
                         .font(.system(size: 30))
                         .scaleEffect(scaleValues[1])
                 }
                 Spacer()
                 // 中间的按钮
                 Button(action:  {
                     // 按钮点击时的动作
                     withAnimation(.easeInOut(duration: 0.5)) {
                         self.scaleValues[2] = 1.5 // 放大
                         DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                             self.scaleValues[2] = 1.0 // 恢复原始大小
                         }
                     }
                     self.selectedTab = 2
                 }) {
                     Image(systemName: "plus.circle.fill")
                         .resizable()
                         .frame(width: 60, height: 60) // 更大的尺寸
                         .padding(.top, -30) // 向上移动，使其部分超出底部导航栏
                         .scaleEffect(scaleValues[2])
                 }
                 .background(Color(UIColor.systemBackground)) // 与背景色相同
                 .offset(y: -20) // 根据需要调整
                 Spacer()
                 // 消息
                 Button(action: {
                     // 按钮点击时的动作
                     withAnimation(.easeInOut(duration: 0.5)) {
                         self.scaleValues[2] = 1.5 // 放大
                         DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                             self.scaleValues[2] = 1.0 // 恢复原始大小
                         }
                     }
                     self.selectedTab = 3
                 }) {
                     Image(systemName: "message.fill")
                         .font(.system(size: 30))
                         .scaleEffect(scaleValues[3])
                 }
                 Spacer()
                 // 我的
                 Button(action: {
                     // 按钮点击时的动作
                     withAnimation(.easeInOut(duration: 0.2)) {
                         self.scaleValues[4] = 1.5 // 放大
                         DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                             self.scaleValues[4] = 1.0 // 恢复原始大小
                         }
                     }
                     self.selectedTab = 4
                 }) {
                     Image(systemName: "person.fill")
                         .font(.system(size: 23))
                         .scaleEffect(scaleValues[4])
                 }
             }
             .frame(maxWidth: .infinity)
             .padding(.horizontal, 20) // 增加水平填充以避免拥挤
             .padding(.top, 10)
             .padding(.bottom, 10 + safeAreaInsets().bottom) // 适配底部安全区域
             .background(Color(UIColor.systemBackground)) // 与背景色相同
             .shadow(color: .gray.opacity(0.2), radius: 10, x: 0, y: -1) // 可选的阴影效果
         }
         .edgesIgnoringSafeArea(.bottom) // 忽略底部安全区域，使背景填满
     }
     
     // 获取底部安全区域的高度
     func safeAreaInsets() -> UIEdgeInsets {
         return UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets.zero
     }
    
    // 根据索引获取图标名称
    func getTabImageName(for index: Int) -> String {
        switch index {
        case 0: return "house.fill"
        case 1: return "magnifyingglass"
        case 3: return "message.fill"
        case 4: return "person.fill"
        default: return ""
        }
    }
 }




#Preview {
    RudderNavigation()
}
