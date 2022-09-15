//
//  HFlowLayoutExample.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2022-07-18.
//

import FrameUp
import SwiftUI

struct HFlowExample: View {
    let items = ["FULayout", "Layup", "Formation", "Board", "Gang", "Herd", "Hord", "Swarm", "Arrangement", "Exhibit", "Blueprint", "Collage"]
        .map { Item(id: UUID(), value: $0) }
    
    @State private var maxWidth: CGFloat = 300
    
    var body: some View {
        VStack {
            HFlow(maxWidth: maxWidth) {
                ForEach(items) { item in
                    Text(item.value)
                        .padding()
                        .foregroundColor(.white)
                        .background(Capsule().fill(.blue))
                }
            }
            .background(Color.gray)
            .animation(.spring(), value: maxWidth)
            .frame(maxWidth: maxWidth, alignment: .leading)

            Spacer()
            
            HStack {
                Stepper("Max Width \(maxWidth, specifier: "%.0F")", value: $maxWidth, in: 50...600, step: 50)
            }
            .padding()
        }
        .navigationTitle("HFlow")
    }
}

struct HFlowExample_Previews: PreviewProvider {
    static var previews: some View {
        HFlowExample()
    }
}
