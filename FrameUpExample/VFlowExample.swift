//
//  VFlowExample.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2021-09-14.
//

import FrameUp
import SwiftUI

struct VFlowExample: View {
    let items = ["Hello", "World", "something", "Longer Text is longer", "Hi", "multi\nline", "one more"]
        .map { Item(id: UUID(), value: $0) }
    
    var body: some View {
        HeightReader { height in
            VFlow(items: items, maxHeight: height, maxColumnWidth: 150) { item in
                Text(item.value)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(12)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(12)
                    .clipped()
            }
            .background(Color.gray.opacity(0.5))
        }
        .frame(height: 300)
    }
}

struct VFlowExample_Previews: PreviewProvider {
    static var previews: some View {
        VFlowExample()
    }
}
