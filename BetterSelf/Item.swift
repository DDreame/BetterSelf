//
//  Item.swift
//  BetterSelf
//
//  Created by 辛晨 on 2024/4/21.
//

import Foundation
import SwiftData

@Model
final class Chest {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
