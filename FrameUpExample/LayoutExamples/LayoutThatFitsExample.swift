//
//  LayoutThatFitsExample.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2022-10-29.
//

import FrameUp
import SwiftUI

@available(iOS 16, macOS 13, *)
struct LayoutThatFitsExample: View {
    @State private var maxWidth: CGFloat = 200
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Above")
            
            LayoutThatFits(in: .horizontal, [HStackLayout(), VStackLayout()]) {
                Color.green.frame(width: 50, height: 50)
                Color.yellow.frame(width: 50, height: 200)
                Color.blue.frame(width: 50, height: 100)
            }
            .animation(.default, value: maxWidth)
            .frame(width: maxWidth)
            .border(Color.red)
            
            Text("Below")
            
            Spacer()
            
            HStack {
                Text("Max Width")
                Slider(value: $maxWidth, in: 50...350) {
                    Text("Max Width")
                }
            }
            .padding()
        }
        .navigationTitle("FULayoutThatFits")
    }
}

@available(iOS 16, macOS 13, *)
struct LayoutThatFitsExample_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            LayoutThatFitsExample()
        }
    }
}
