//
//  ChestView.swift
//  BetterSelf
//
//  Created by DDreame on 2024/4/22.
//

import Foundation
import SwiftUI

struct ChestView: View {
    @Bindable var chest: ChestSingle
    var isEdit: Bool = false
    var body: some View {
        if isEdit {
            VStack(alignment: .leading) {
                TextField("Training Action", text: $chest.fitType)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                HStack {
                    Stepper("Times: \(chest.times)", value: $chest.times, in: 1...10)
                    Spacer()
                    Stepper("Sets: \(chest.groups)", value: $chest.groups, in: 1...10)
                }
            
                TextField("Training Strength", text: $chest.strength)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
    //            // 以下是数值类型, 这里先用文本
    //            Slider(value: $chest.trainingIntensity, in: 0...100, step: 1) {
    //                Text("Intensity")
    //            } minimumValueLabel: {
    //                Text("0")
    //            } maximumValueLabel: {
    //                Text("100")
    //            }
            }
        }
        else{
            VStack(alignment: .leading) {
                Text("Training Action: \(chest.fitType)")
                HStack {
                    Text("Times: \(chest.times)")
                    Spacer()
                    Text("Sets: \(chest.groups)")
                }
                ProgressView(value: 95, total: 100.0)
                    .accentColor(.green)
            }
            .padding()
        }
    }
}
