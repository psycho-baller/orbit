//
//  Item.swift
//  Orbit
//
//  Created by Rami Maalouf on 2024-10-15.
//

import Foundation
import SwiftData

struct Item {
    var id: Int
    var timestamp: Date
    
    init(id: Int, timestamp: Date) {
        self.id = id
        self.timestamp = timestamp
    }
}
