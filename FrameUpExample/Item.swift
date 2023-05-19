//
//  Item.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2021-09-14.
//

import Foundation

struct Item<Value>: Identifiable {
    var id = UUID()
    var value: Value
}

extension Item: Equatable where Value: Equatable { }

extension Array<Item<String>> {
    static var examples: Self {
        ["Here", "are", "several", "example", "items", "useful for", "creating", "example layouts", "in", "FrameUp"]
            .map { Item(id: UUID(), value: $0) }
    }
}
