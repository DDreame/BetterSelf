//
//  RudderNavigationView.swift
//  BetterSelf
//
//  Created by DDreame on 2024/4/23.
//

import SwiftUI

struct RudderNavigationView: View {
    // 用于存储旋转角度
    @State private var rotation: Angle = .zero
    
    var body: some View {
        // 一个简单的矩形，用于表示舵或者是导航的视图
        Rectangle()
            .frame(width: 100, height: 200)
            .foregroundColor(.blue)
            .rotationEffect(rotation)
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        // 根据拖动的水平距离来调整旋转角度
                        // 这里的旋转系数可以根据需要进行调整
                        self.rotation = Angle(degrees: Double(gesture.translation.width) * 0.5)
                    }
                    .onEnded { _ in
                        // 手势结束时，可以将视图旋转回初始位置
                        // 或者保持当前位置，这取决于你的需求
                        withAnimation {
                            self.rotation = .zero
                        }
                    }
            )
    }
}

struct RudderNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        RudderNavigationView()
    }
}


#Preview {
    RudderNavigationView()
}
