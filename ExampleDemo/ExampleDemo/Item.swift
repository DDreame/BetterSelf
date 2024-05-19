//
//  Item.swift
//  ExampleDemo
//
//  Created by DDreame on 2024/5/19.
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
