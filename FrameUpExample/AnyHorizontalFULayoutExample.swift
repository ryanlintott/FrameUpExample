//
//  AnyHorizontalFULayoutExample.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2022-10-19.
//

import FrameUp
import SwiftUI

struct AnyHorizontalFULayoutExample: View {
    @State private var items = ["These", "Items", "can be arranged", "into any", "layout", "you like", "with", "FrameUp"]
        .map { Item(id: UUID(), value: $0) }
    @State private var layoutIndex = 0
    
    func layouts(maxHeight: CGFloat) -> [any FULayout] {
        [
            VFlow(alignment: .topLeading, maxHeight: maxHeight),
            VFlow(alignment: .top, maxHeight: maxHeight),
            VFlow(alignment: .topTrailing, maxHeight: maxHeight),
            VFlow(alignment: .leading, maxHeight: maxHeight),
            VFlow(alignment: .center, maxHeight: maxHeight),
            VFlow(alignment: .trailing, maxHeight: maxHeight),
            VFlow(alignment: .bottomLeading, maxHeight: maxHeight),
            VFlow(alignment: .bottom, maxHeight: maxHeight),
            VFlow(alignment: .bottomTrailing, maxHeight: maxHeight),
            
            HMasonry(alignment: .leading, rows: 3, maxHeight: maxHeight),
            HMasonry(alignment: .center, rows: 3, maxHeight: maxHeight),
            HMasonry(alignment: .trailing, rows: 3, maxHeight: maxHeight),
            
            HStackFULayout(alignment: .top, maxHeight: maxHeight),
            HStackFULayout(alignment: .center, maxHeight: maxHeight),
            HStackFULayout(alignment: .bottom, maxHeight: maxHeight)
        ]
    }
    
    var body: some View {
        ScrollView(.horizontal) {
            HeightReader { height in
                HStack {
                    Text("Before")
                    
                    layouts(maxHeight: height)[layoutIndex].anyFULayout {
                        ForEach(items) { item in
                            Text(item.value)
                                .padding(12)
                                .foregroundColor(.white)
                                .frame(height: CGFloat(item.value.count) * 6)
                                .background(Color.blue)
                                .cornerRadius(12)
                        }
                    }
                    .background(Color.gray.opacity(0.5))
                    .border(Color.red)
                    .onTapGesture {
                        layoutIndex = (layoutIndex + 1) % layouts(maxHeight: 0).count
                    }
                    
                    Text("After")
                }
                .animation(.default, value: layoutIndex)
            }
        }
        .frame(height: 350)
    }
}

struct AnyHorizontalFULayoutExample_Previews: PreviewProvider {
    static var previews: some View {
        AnyHorizontalFULayoutExample()
    }
}
