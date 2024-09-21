//
//  FlippingViewExample.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2022-09-15.
//

#if !os(visionOS)
import FrameUp
import SwiftUI

struct FlippingViewExample: View {
    @State private var flips: Int = 0
    var isFaceUp: Bool { flips.isMultiple(of: 2) }
    @State private var axis: Axis = .horizontal
    @State private var perspective: CGFloat = 1
    
    var body: some View {
        VStack {
            FlippingView(
                axis,
                flips: $flips,
                perspective: perspective
            ) {
                ZStack {
                    Color.blue
                    Text("Front")
                }
                .cornerRadius(20)
            } back: {
                ZStack {
                    Color.red
                    Text("Back")
                }
                .cornerRadius(20)
            }
            .font(.largeTitle)
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
                    #if os(tvOS)
                    Text("Perspective \(perspective)")
                    Button("-") { perspective = max(0, perspective - 0.1) }
                    Button("+") { perspective = min(1, perspective + 0.1) }
                    #else
                    Text("Perspective")
                    Slider(value: $perspective, in: 0...1)
                        .padding()
                    #endif
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
#endif
