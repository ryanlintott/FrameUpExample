//
//  VFlowLayoutExample.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2022-07-18.
//

import FrameUp
import SwiftUI

struct VFlowLayoutExample: View {
    
    @State private var maxWidth: CGFloat = 300
    
    let items = ["FULayout", "Layup", "Formation", "Board", "Gang", "Herd", "Hord", "Swarm", "Arrangement", "Exhibit", "Blueprint", "Collage"]
        .map { Item(id: UUID(), value: $0) }
    
    var body: some View {
        VStack {
            VFlowLayout(maxWidth: maxWidth)._view {
                ForEach(items) { item in
                    Text(item.value)
                        .padding()
                        .foregroundColor(.white)
                        .background(Capsule().fill(.blue))
                }
            }
            .animation(.spring(), value: maxWidth)
            .onTapGesture {
                maxWidth -= 50
            }
            
            VFlowLayout(maxWidth: maxWidth).forEach(items) { item in
                Text(item.value)
                    .padding()
                    .foregroundColor(.white)
                    .background(Capsule().fill(.blue))
            }
            .animation(.spring(), value: maxWidth)
            .onTapGesture {
                maxWidth += 50
            }
        }
    }
}

struct VFlowLayoutExample_Previews: PreviewProvider {
    static var previews: some View {
        VFlowLayoutExample()
    }
}
