//
//  TestButtonView.swift
//  BetterSelf
//
//  Created by DDreame on 2024/4/23.
//

import SwiftUI

struct CustomIconButton: View {
    var body: some View {
        Button(action: {
            // 在这里执行按钮点击后的操作
            print("按钮被点击")
        }) {
            HStack {
                Image("CustomIcon") // 使用自定义图标
                    .resizable() // 使图片可以被调整大小
                    .scaledToFit() // 保持图片的宽高比
                    .frame(width: 24, height: 24) // 设置图片的大小
                Text("按钮文字") // 按钮的文字
            }
            .padding() // 给按钮内部内容添加一些填充
            .foregroundColor(.white) // 设置前景色，即文字和图片的颜色
            .background(Color.blue) // 设置按钮的背景色
            .cornerRadius(8) // 给按钮背景添加圆角
        }
    }
}

struct CustomizableButton: View {
    let action: () -> Void
    let imageName: String
    let buttonText: String

    var body: some View {
        Button(action: action) {
            HStack {
                Image(imageName) // 使用传入的图片名称
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                Text(buttonText) // 使用传入的按钮文字
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(8)
        }
    }
}

func pr() {
    print("被点击")
}
#Preview {
    CustomIconButton()
}

#Preview {
    CustomizableButton(action: pr, imageName: "Custom", buttonText: "test")
}
