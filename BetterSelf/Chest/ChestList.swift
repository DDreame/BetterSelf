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
    var chestList: [ChestSingle]
    
    // 训练日期
    var timestamp: Date
    
    // 训练类别
    var fitType: String
    
    init(chestList: [ChestSingle], timestamp: Date, fitType: String) {
        self.chestList = chestList
        self.timestamp = timestamp
        self.fitType = fitType
    }
    
    func insert(chest: ChestSingle){
        self.chestList.append(chest)
    }
    
    static let sampleData = [
        ChestList(chestList:[ChestSingle(index: 1,fitType: "卧推5", strength: "15kg", times: 10, groups: 4),
                               ChestSingle(index: 2,fitType: "卧推6", strength: "15kg", times: 10, groups: 4),
                               ChestSingle(index: 3,fitType: "卧推10", strength: "15kg", times: 10, groups: 4),
                               ChestSingle(index: 4,fitType: "卧推8", strength: "15kg", times: 10, groups: 4)],
            timestamp:Date(timeIntervalSinceReferenceDate: -402_000_000),
                 fitType: "Chest"),
        ChestList(chestList:[ChestSingle(index: 1,fitType: "卧推5", strength: "15kg", times: 10, groups: 4),
                             ChestSingle(index: 2,fitType: "卧推6", strength: "15kg", times: 10, groups: 4),
                             ChestSingle(index: 3,fitType: "卧推7", strength: "15kg", times: 10, groups: 4),
                             ChestSingle(index: 4,fitType: "卧推8", strength: "15kg", times: 10, groups: 4)],
            timestamp: Date(timeIntervalSinceReferenceDate: -198_000_000),
                  fitType: "Chest"),
        ChestList(chestList:[ChestSingle(index: 1,fitType: "卧推5", strength: "15kg", times: 10, groups: 4),
                             ChestSingle(index: 2,fitType: "卧推6", strength: "15kg", times: 10, groups: 4),
                             ChestSingle(index: 3,fitType: "卧推7", strength: "15kg", times: 10, groups: 4),
                             ChestSingle(index: 4,fitType: "卧推8", strength: "15kg", times: 10, groups: 4)],
            timestamp: Date(timeIntervalSinceReferenceDate: -321_000_000),
                  fitType: "Chest"),
        ChestList(chestList:[ChestSingle(index: 1,fitType: "卧推5", strength: "15kg", times: 10, groups: 4),
                             ChestSingle(index: 2,fitType: "卧推6", strength: "15kg", times: 10, groups: 4),
                             ChestSingle(index: 3,fitType: "卧推7", strength: "15kg", times: 10, groups: 4),
                             ChestSingle(index: 4,fitType: "卧推8", strength: "15kg", times: 10, groups: 4)],
            timestamp: Date(timeIntervalSinceReferenceDate: 402_000_000),
                  fitType: "Chest"),
        ChestList(chestList:[ChestSingle(index: 1,fitType: "引体向上5", strength: "15kg", times: 10, groups: 4),
                               ChestSingle(index: 2,fitType: "引体向上6", strength: "15kg", times: 10, groups: 4),
                               ChestSingle(index: 3,fitType: "引体向上10", strength: "15kg", times: 10, groups: 4),
                               ChestSingle(index: 4,fitType: "引体向上8", strength: "15kg", times: 10, groups: 4)],
            timestamp:Date(timeIntervalSinceReferenceDate: -402_000_000),
                 fitType: "Back"),
        ChestList(chestList:[ChestSingle(index: 1,fitType: "引体向上5", strength: "15kg", times: 10, groups: 4),
                             ChestSingle(index: 2,fitType: "引体向上6", strength: "15kg", times: 10, groups: 4),
                             ChestSingle(index: 3,fitType: "引体向上7", strength: "15kg", times: 10, groups: 4),
                             ChestSingle(index: 4,fitType: "引体向上8", strength: "15kg", times: 10, groups: 4)],
            timestamp: Date(timeIntervalSinceReferenceDate: -198_000_000),
                  fitType: "Back"),
        ChestList(chestList:[ChestSingle(index: 1,fitType: "深蹲5", strength: "15kg", times: 10, groups: 4),
                             ChestSingle(index: 2,fitType: "深蹲6", strength: "15kg", times: 10, groups: 4),
                             ChestSingle(index: 3,fitType: "深蹲7", strength: "15kg", times: 10, groups: 4),
                             ChestSingle(index: 4,fitType: "深蹲8", strength: "15kg", times: 10, groups: 4)],
            timestamp: Date(timeIntervalSinceReferenceDate: -321_000_000),
                  fitType: "Leg"),
        ChestList(chestList:[ChestSingle(index: 1,fitType: "飞鸟5", strength: "15kg", times: 10, groups: 4),
                             ChestSingle(index: 2,fitType: "飞鸟6", strength: "15kg", times: 10, groups: 4),
                             ChestSingle(index: 3,fitType: "飞鸟7", strength: "15kg", times: 10, groups: 4),
                             ChestSingle(index: 4,fitType: "飞鸟8", strength: "15kg", times: 10, groups: 4)],
            timestamp: Date(timeIntervalSinceReferenceDate: 402_000_000),
                  fitType: "Shoulder")
    ]
    
    
}
