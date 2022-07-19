//
//  AnyLayoutExample.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2022-05-31.
//

import FrameUp
import SwiftUI

struct AnyLayoutExample: View {
    let items = ["These", "Items", "can be arranged", "into any", "layout", "you like", "with", "FrameUp"]
        .map { Item(id: UUID(), value: $0) }
    
    let layouts: [Layout] = [
        VStackLayoutStyle(maxWidth: 300).layout,
        HStackLayoutStyle(maxHeight: 310).layout,
        VFlowLayoutStyle(maxWidth: 320).layout,
        HFlowLayoutStyle(maxHeight: 330).layout,
        VMasonryLayoutStyle(columns: 3, maxWidth: 301).layout,
        ZStackLayoutStyle(maxWidth: 300, maxHeight: 302).layout
    ]
    let layoutNames = [
        "VStack",
        "HStack",
        "VFlow",
        "HFlow",
        "VMasonry",
        "ZStack"
    ]

    @State private var layoutIndex = 0
    
    var body: some View {
        GeometryReader { proxy in
            AnyLayout(items, layout: layouts[layoutIndex]) { item in
                Text(item.value)
                    .padding(12)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(12)
                    .clipped()
            }
            .background(Color.gray.opacity(0.5))
            .animation(.spring(), value: layoutIndex)
        }
        .onTapGesture {
            layoutIndex = (layoutIndex + 1) % layouts.count
        }
        .navigationTitle("\(layoutNames[layoutIndex])")
    }
}

struct AnyLayoutExample_Previews: PreviewProvider {
    static let data = ["One", "Two", "Three"].map({ Item(id: UUID(), value: $0) })
    static var previews: some View {
        NavigationView {
            AnyLayoutExample()
        }
    }
}
