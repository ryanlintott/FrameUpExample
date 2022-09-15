//
//  SmartScrollViewSimpleExample.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2022-09-13.
//

import FrameUp
import SwiftUI

struct SmartScrollViewSimpleExample: View {
    @State private var maxHeight: CGFloat = 200
    
    var body: some View {
        VStack {
            SmartScrollView([.vertical], optionalScrolling: true, shrinkToFit: true) {
                Text("Hello")
                    .frame(height: 1000)
                    .background(Color.blue)
            }
            .id(maxHeight)
            .background(Color.red)
            // padding of at least 1 point is needed when inside a navigation stack as it will resize the available space
            .padding(.top, 1)
            .frame(maxHeight: maxHeight)
            .background(Color.yellow)
            
            Stepper("maxHeight: \(maxHeight)", value: $maxHeight, step: 50)
        }
    }
}

struct SmartScrollViewSimpleExample_Previews: PreviewProvider {
    static var previews: some View {
        SmartScrollViewSimpleExample()
    }
}
