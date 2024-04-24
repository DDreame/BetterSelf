//
//  TestButtonPopupView.swift
//  BetterSelf
//
//  Created by DDreame on 2024/4/23.
//

import SwiftUI

struct FloatingMenuButton: View {
    let icons = ["pencil", "lasso", "photo", "bubble.left"]
    let labels = ["Edit", "Select", "Gallery", "Message"]
    
    @State private var isOpen = false
    
    var body: some View {
        VStack {
            if isOpen {
                ForEach(icons.indices.reversed(), id: \.self) { index in
                    Button(action: {
                        // 在这里处理每个按钮的点击事件
                    }) {
                       // HStack {
//                            Text(labels[index])
//                                .font(.caption)
//                                .foregroundColor(.white)
//
//                        }
                        Image(systemName: icons[index])
                            .offset(y: isOpen ? CGFloat(-((index + 1) * 30)) : 0)
                            .foregroundColor(.white)
                            .background(Circle().fill(Color.blue))
                            .padding()
                            .opacity(isOpen ? 1 : 0)
                    }
                    .transition(.scale)
                    .border(Color.blue, width: 2)
                }
            }
            
            Button(action: {
                withAnimation {
                    self.isOpen.toggle()
                }
            }) {
                Image(systemName: isOpen ? "xmark" : "plus")
                    .foregroundColor(.white)
                    .padding()
                    .background(Circle().fill(Color.blue))
            }
            .border(Color.blue, width: 2)
        }
//        .background(RoundedRectangle(cornerRadius: 30).stroke(Color.blue, lineWidth: 2))

    }
}

struct TestButtonPopupView: View {
    var body: some View {
        VStack {
            Spacer()
            FloatingMenuButton()
        }
    }
}



#Preview {
    TestButtonPopupView()
}
