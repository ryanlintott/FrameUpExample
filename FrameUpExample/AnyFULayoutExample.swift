//
//  AnyFULayoutExample.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2022-07-18.
//

import FrameUp
import SwiftUI

struct AnyFULayoutExample: View {
    let items = ["These", "Items", "can be arranged", "into any", "layout", "you like", "with", "FrameUp"]
        .map { Item(id: UUID(), value: $0) }
    
    let layouts: [AnyFULayout] = [
        AnyFULayout(VStackLayout(maxWidth: 300)),
        AnyFULayout(HStackLayout(maxHeight: 310)),
        AnyFULayout(VFlowLayout(maxWidth: 320)),
        AnyFULayout(HFlowLayout(maxHeight: 330)),
        AnyFULayout(VMasonryLayout(columns: 3, maxWidth: 301)),
        AnyFULayout(ZStackLayout(maxWidth: 300, maxHeight: 302))
    ]

    @State private var layoutIndex = 0
    
    var layout: AnyFULayout {
        layouts[layoutIndex]
    }

    var body: some View {
        GeometryReader { proxy in
            layout.forEach(items) { item in
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
        .navigationTitle("\(layouts[layoutIndex].fuLayoutName)")
    }
}

struct AnyFULayoutExample_Previews: PreviewProvider {
    static let data = ["One", "Two", "Three"].map({ Item(id: UUID(), value: $0) })
    static var previews: some View {
        NavigationView {
            AnyFULayoutExample()
        }
    }
}
