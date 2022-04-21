//
//  Item.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2021-09-14.
//

import Foundation

struct Item<T>: Identifiable {
    var id = UUID()
    var value: T
}
