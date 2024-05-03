//
//  ImageWithTextView.swift
//  BetterSelf
//
//  Created by DDreame on 2024/4/29.
//

import SwiftUI

struct ImageWithTextView: View {
    @State private var showImage = true
      @State private var showText = false

      var body: some View {
          VStack {
              if showImage {
                  Image(systemName: "bell") // 替换为实际的图片名称
                      .resizable()
                      .frame(width: 100, height: 100) // 设置图片大小
                      .onAppear {
                          withAnimation(.easeInOut(duration: 1)) {
                              print("showText \(showText)")
                              showText = true
                          }
                      }
              }
              if showText {
                  Text("Your Text Here11111111") // 替换为你想显示的文字
                      .padding(.trailing, 10) // 给文字添加一些右边距
              }
          }
          .padding() // 给整个VStack添加一些内边距
          .onAppear {
              withAnimation(.easeInOut(duration: 1)) {
                  print("showText \(showText)")
                  showText = true
              }
          }
          .onDisappear {
              withAnimation(.easeInOut(duration: 1)) {
                  print("showText \(showText)")
                  showText = false
              }
          }
          .overlay(
              Button(action: {
                  withAnimation(.easeInOut(duration: 1)) {
                      showImage.toggle()
                  }
                  if !showImage {
                      DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                          withAnimation(.easeInOut(duration: 1)) {
                              showText = false
                          }
                      }
                  }
              }, label: {
                  Text("Toggle Image")
              })
          )
      }

}

#Preview {
    ImageWithTextView()
}
