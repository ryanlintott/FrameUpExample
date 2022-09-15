//
//  RelativePaddingExample.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2022-01-31.
//

import FrameUp
import SwiftUI

struct RelativePaddingExample: View {
    @State private var width: CGFloat = 100
    @State private var height: CGFloat = 200
    @State private var padding: CGFloat = 0.1
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer(minLength: 0)
            
            Color.green
                .relativePadding(.horizontal, padding)
                .background(Color.yellow)
                .relativePadding([.leading, .top], padding)
                .background(Color.blue)
                .relativePadding(padding)
                .background(Color.red)
                .frame(width: width, height: height)
            
            Text("Use Negative values to create relative overlaps")
                .background(Color.gray.opacity(0.5))
                .relativePadding(.top, -padding)
            
            Spacer(minLength: 0)
            
            VStack(alignment: .leading) {
                Text("Width (20 - 100)")
                Slider(value: $width, in: 20...100) {
                    Text("Width")
                }
                
                Text("Height (20 - 200)")
                Slider(value: $height, in: 20...200) {
                    Text("Height")
                }
                
                Text("Padding (0 - 0.2)")
                Slider(value: $padding, in: 0...0.2) {
                    Text("Padding")
                }
            }
            .padding()
        }
        .navigationTitle("RelativePadding")
    }
}

struct RelativePaddingExample_Previews: PreviewProvider {
    static var previews: some View {
        RelativePaddingExample()
    }
}
