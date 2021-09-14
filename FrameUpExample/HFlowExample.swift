//
//  HFlowExample.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2021-09-14.
//

import FrameUp
import SwiftUI

struct HFlowExample: View {
    let items = ["Hello", "World", "something", "Longer Text is longer", "Hi", "multi\nline", "one more"]
        .map { Item(id: UUID(), value: $0) }
    
    var body: some View {
        WidthReader { width in
            HFlow(items: items, maxWidth: width) { item in
                Text(item.value)
                    .padding(12)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(12)
                    .clipped()
            }
            .background(Color.gray.opacity(0.5))
        }
    }
}

struct HFlowExample_Previews: PreviewProvider {
    static var previews: some View {
        HFlowExample()
    }
}
