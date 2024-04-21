//
//  Chest.swift
//  BetterSelf
//
//  Created by DDreame on 2024/4/21.
//

import Foundation
import SwiftData

@Model
final class ChestSingle {
    // 训练动作
    var fitType: String
    // 训练强度
    var strength: String
    // 训练次数
    var times: Int
    // 训练组数
    var groups: Int
    
    init(fitType: String, strength: String, times: Int, groups: Int) {
        self.fitType = fitType
        self.strength = strength
        self.times = times
        self.groups = groups
    }
    static let sampleData = [
        ChestSingle(fitType: "卧推", strength: "15kg", times: 10, groups: 4),
        ChestSingle(fitType: "卧推", strength: "15kg", times: 10, groups: 4),
        ChestSingle(fitType: "卧推", strength: "15kg", times: 10, groups: 4),
        ChestSingle(fitType: "卧推", strength: "15kg", times: 10, groups: 4),
    ]
    
}
