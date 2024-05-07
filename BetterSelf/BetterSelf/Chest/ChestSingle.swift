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
    var index: Int
    // 训练动作
    var fitType: String
    // 训练强度
    var strength: String
    // 训练次数
    var times: Int
    // 训练组数
    var groups: Int
    
    init(index: Int, fitType: String, strength: String, times: Int, groups: Int) {
        self.index = index
        self.fitType = fitType
        self.strength = strength
        self.times = times
        self.groups = groups
    }
    static let sampleData = [
        ChestSingle(index: 0,fitType: "卧推1", strength: "15kg", times: 10, groups: 4),
        ChestSingle(index: 1,fitType: "卧推2", strength: "15kg", times: 10, groups: 4),
        ChestSingle(index: 2,fitType: "卧推3", strength: "15kg", times: 10, groups: 4),
        ChestSingle(index: 0,fitType: "卧推4", strength: "15kg", times: 10, groups: 4),
    ]
    
}
