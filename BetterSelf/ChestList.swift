//
//  ChestList.swift
//  BetterSelf
//
//  Created by DDreame on 2024/4/21.
//

import Foundation
import SwiftData

@Model
class ChestList{
    var list: [ChestSingle]
    
    // 训练日期
    var timestamp: Date
    
    init(list: [ChestSingle], timestamp: Date) {
        self.list = list
        self.timestamp = timestamp
    }
}
