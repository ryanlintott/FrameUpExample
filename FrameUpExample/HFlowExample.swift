//
//  HFlowExample.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2021-09-14.
//

import FrameUp
import SwiftUI

struct HFlowExample: View {
    let items = ["World", "Hello here is some very very very long text", "something", "Longer Text is longer", "multi\nline", "Hi", "one more"]
        .map { Item(id: UUID(), value: $0) }
    
    var body: some View {
        WidthReader { width in
            HFlow(items: items, maxWidth: width) { item in
                Text(item.value)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(maxWidth: 200)
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
