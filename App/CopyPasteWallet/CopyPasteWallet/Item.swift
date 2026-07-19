//
//  Item.swift
//  CopyPasteWallet
//
//  Created by Dharamveer Kanda on 19/7/2026.
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
