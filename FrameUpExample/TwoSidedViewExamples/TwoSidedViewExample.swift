//
//  TwoSidedViewExample.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2022-09-15.
//

import FrameUp
import SwiftUI

struct TwoSidedViewExample: View {
    @State private var angle: Angle = .zero
    @State private var axis: Axis = .horizontal
    
    var rotationAxis: (x: CGFloat, y: CGFloat, z: CGFloat) {
        axis == .horizontal ? (0,1,0) : (1,0,0)
    }
    
    var backView: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(.red)
            .overlay(Text("Down"))
    }
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.blue)
                .overlay(Text("Up"))
                #if os(visionOS)
                .rotation3DEffect(angle, axis: axis == .horizontal ? .y : .x) {
                    backView
                }
                .offset(z: 100)
                .frame(width: 200, height: 200)
                #else
                /// This modifier creates the two-sided view by supplying a rotation and a back side.
                .rotation3DEffect(angle, axis: axis == .horizontal ? (0,1,0) : (1,0,0), perspective: 0.5) {
                    backView
                }
                #endif
                .padding()
            
            Picker("Axis", selection: $axis) {
                ForEach(Axis.allCases, id: \.self) { axis in
                    Text("\(axis.description)")
                }
            }
            .pickerStyle(.segmented)
            
            Text("Change Rotation")
            HStack {
                ForEach([-360,-180,-90,-45,45,90,180,360], id: \.self) { i in
                    Button("\(i > 0 ? "+" : "")\(i)") {
                        withAnimation(.spring().speed(0.4)) {
                            angle += .degrees(Double(i))
                        }
                    }
                    .padding(1)
                }
            }
            .padding()
        }
    }
}

struct TwoSidedViewExample_Previews: PreviewProvider {
    static var previews: some View {
        TwoSidedViewExample()
    }
}
