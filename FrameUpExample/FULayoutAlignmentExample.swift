//
//  LayoutAlignmentExample.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2022-09-08.
//

import FrameUp
import SwiftUI

struct FULayoutAlignmentExample: View {
    let items = ["FULayout", "Layup", "Formation", "Board", "Gang", "Herd", "Hord", "Swarm", "Arrangement", "Exhibit", "Blueprint", "Collage"]
        .map { Item(id: UUID(), value: $0) }
    
    var body: some View {
        VFlowFULayout(
            alignment: .topLeading,
            maxWidth: 200,
            itemAlignment: .top,
            maxItemWidth: nil,
            horizontalSpacing: nil,
            verticalSpacing: nil
        )._view {
            ForEach(items) { item in
                Text(item.value)
                    .padding(12)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(12)
                    .clipped()
            }
        }
    }
}

struct FULayoutAlignmentExample_Previews: PreviewProvider {
    static var previews: some View {
        FULayoutAlignmentExample()
    }
}
