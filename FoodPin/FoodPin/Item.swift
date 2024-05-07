//
//  Item.swift
//  FoodPin
//
//  Created by DDreame on 2024/5/7.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
