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
    
    @State private var maxHeight: CGFloat = 300
    
    var body: some View {
        VStack {
            VFlow(maxHeight: maxHeight) {
                ForEach(items) { item in
                    Text(item.value)
                        .padding()
                        .foregroundColor(.white)
                        .background(Capsule().fill(.blue))
                }
            }
            .background(Color.gray)
            .frame(maxHeight: maxHeight, alignment: .top)
            .animation(.spring(), value: maxHeight)
            
            Spacer()
            
            HStack {
                Stepper("Max Height \(maxHeight, specifier: "%.0F")", value: $maxHeight, in: 50...600, step: 50)
            }
            .padding()
        }
        .navigationTitle("VFlow")
    }
}

struct VFlowExample_Previews: PreviewProvider {
    static var previews: some View {
        VFlowExample()
    }
}
