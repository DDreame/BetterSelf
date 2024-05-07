//
//  PopupView.swift
//  BetterSelf
//
//  Created by DDreame on 2024/4/23.
//

import SwiftUI

struct PopupView: View {
    @Binding var showPopup: Bool

    var body: some View {
        ZStack {
            if showPopup {
                // Top panel
                VStack {
                    Text("Top Panel")
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.red)
                    Text("Top Panel")
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.red)
                    Text("Top Panel")
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.red)
                    Text("Top Panel")
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.red)
                    Spacer()
                }
                .transition(.move(edge: .top))

                // Bottom panel
                VStack {
                    Spacer()
                    VStack(spacing: 20) {
                        Button("Button 1", action: {})
                        Button("Button 1", action: {})
                        Button("Button 1", action: {})
                        Button("Button 1", action: {})
                        Button("Button 2", action: {})
                        Button("Button 3", action: {})
                        Button("Close") {
                            withAnimation {
                                showPopup = false
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                }
                .transition(.move(edge: .bottom))
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}


