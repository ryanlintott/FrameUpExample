//
//  SmartScrollViewSimpleExample.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2022-09-13.
//

import FrameUp
import SwiftUI

struct SmartScrollViewSimpleExample: View {
    @State private var optionalScrolling = true
    @State private var shrinkToFit = true
    @State private var maxHeight: CGFloat = 200
    @State private var height: CGFloat = 100
    
    var body: some View {
        VStack {
            SmartScrollView([.vertical], optionalScrolling: optionalScrolling, shrinkToFit: shrinkToFit) {
                Text("Hello")
                    .frame(height: height)
                    .background(Color.blue)
            }
            .id(maxHeight)
            .background(Color.red)
            // padding of at least 1 point is needed when inside a navigation stack as it will resize the available space
            .frame(maxHeight: maxHeight, alignment: .top)
            .padding(.top, 1)
            .border(Color.red)
            
            Spacer()
            
            VStack {
                Toggle(isOn: $optionalScrolling) {
                    Text("Optional Scrolling")
                }
                Toggle(isOn: $shrinkToFit) {
                    Text("Shrink to Fit")
                }
                Stepper("Content Height: \(height)", value: $height, in: 50...1000, step: 50)
                Stepper("Available Height: \(maxHeight)", value: $maxHeight, in: 50...1000, step: 50)
            }
            .padding()
        }
        .navigationTitle("SmartScrollViewSimple")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SmartScrollViewSimpleExample_Previews: PreviewProvider {
    static var previews: some View {
        SmartScrollViewSimpleExample()
    }
}
