//
//  HFlowBoxExample.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2022-10-18.
//

import FrameUp
import SwiftUI

struct HFlowBoxExample: View {
    @State private var alignment: FUAlignment = .center
    @State private var boxes = [1,2,3,4,5]
    
    var body: some View {
        VStack {
            ScrollView {
                WidthReader { width in
                    HFlow(alignment: alignment, maxWidth: width) {
                        ForEach(boxes, id: \.self) { box in
                            Color.red
                                .frame(width: 80, height: 80)
                                .padding()
                        }
                    }
                }
            }
            .animation(.default, value: boxes)
            .animation(.default, value: alignment)
            
            Spacer()
            
            Text("Elements")
                .font(.title)
            
            HStack {
                Button("Remove") {
                    if !boxes.isEmpty {
                        boxes.removeLast()
                    }
                }
                Button("Add") {
                    boxes.append((boxes.last ?? 0) + 1)
                }
            }
            
            
            Text("Alignment")
                .font(.title)
            HStack {
                Button("Leading") { alignment = .leading }
                Button("Center") { alignment = .center }
                Button("Trailing") { alignment = .trailing }
            }
        }
        .navigationTitle("HFlow Box")
    }
}

struct HFlowBoxExample_Previews: PreviewProvider {
    static var previews: some View {
        HFlowBoxExample()
    }
}
