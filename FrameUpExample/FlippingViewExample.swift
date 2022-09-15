//
//  FlippingViewExample.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2022-09-15.
//

import FrameUp
import SwiftUI

struct FlippingViewExample: View {
    @State private var flips: Int = 0
    var isFaceUp: Bool { flips.isMultiple(of: 2) }
    @State private var axis: Axis = .horizontal
    @State private var perspective: CGFloat = 1
    
    var body: some View {
        VStack {
            FlippingView(axis, flips: $flips, perspective: perspective) {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.blue)
                    .overlay(Text("Up").font(.largeTitle).bold())
            } back: {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.red)
                    .overlay(Text("Down").font(.largeTitle).bold())
            }
            .padding(40)
            
            VStack {
                HStack {
                    Text("Flips: \(flips)")
                    Spacer()
                    Text("Face \(isFaceUp ? "Up" : "Down")")
                }
                
                HStack {
                    Text("Axis")
                    Picker("Axis", selection: $axis) {
                        ForEach(Axis.allCases, id: \.self) { axis in
                            Text("\(axis.description)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
            
                HStack {
                    Text("Perspective")
                    Slider(value: $perspective, in: 0...1)
                        .padding()
                }
                HStack {
                    Text("Programmatic flip")
                    Button("-1") { flips -= 1 }
                    Button("+1") { flips += 1 }
                }
            }
            .padding()
        }
    }
}

struct FlippingViewExample_Previews: PreviewProvider {
    static var previews: some View {
        FlippingViewExample()
    }
}
