//
//  CustomFULayoutExample.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2022-09-15.
//

import FrameUp
import SwiftUI

struct CustomFULayout: FULayout {
    let maxWidth: CGFloat
    
    var fixedSize: Axis.Set = .horizontal
    var maxItemWidth: CGFloat? { maxWidth / 2 }
    var maxItemHeight: CGFloat? = nil
    
    func contentOffsets(sizes: [Int : CGSize]) -> [Int : CGPoint] {
        var heightOffset = 0.0
        var rowHeight = 0.0
        var offsets = [Int : CGPoint]()
        for size in sizes.sortedByKey() {
            let widthOffset = (size.key % 2 == 0) ? -size.value.width : 0
            
            offsets.updateValue(
                CGPoint(x: widthOffset, y: heightOffset),
                forKey: size.key
            )
            rowHeight = (size.key % 2 == 0) ? size.value.height : max(size.value.height, rowHeight)
            heightOffset += (size.key % 2 == 0) ? 0 : rowHeight
        }
        return offsets
    }
}


struct CustomFULayoutExample: View {
    var body: some View {
        WidthReader { width in
            CustomFULayout(maxWidth: width) {
                Text("First")
                Text("Second").font(.title)
                Text("Third").font(.title)
                Text("Fourth")
                Text("Fifth")
            }
        }
    }
}

struct CustomFULayoutExample_Previews: PreviewProvider {
    static var previews: some View {
        CustomFULayoutExample()
    }
}
