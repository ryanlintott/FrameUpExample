//
//  OverlappingImageHorizonalExample.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2021-09-15.
//

import FrameUp
import SwiftUI

struct OverlappingImageHorizontalExample: View {
    let image = Image(systemName: "star.square")
    
    @State private var leading: CGFloat = 0.1
    @State private var trailing: CGFloat = 0.25
    
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                Text("Overlapping Image")
                    .font(.system(size: 15))
                Rectangle()
                    .frame(width: 5)
                
                OverlappingImage(image, aspectRatio: 1.0, left: leading, right: trailing)
                    .foregroundColor(.blue.opacity(0.5))
                    .padding(.vertical, 50)
                    .zIndex(1)
                
                VStack {
                    Text("The image to the left will overlap content to the left and right with an inset based on a percent of the image width.")
                        .padding(20)
                }
                .background(Color.gray)
                .padding(3)
                .background(Color.red)
            }
            .frame(width: 300, height: 500)
            
            VStack {
                HStack {
                    Text("Leading \(leading * 100, specifier: "%.0f")%")
                    Slider(value: $leading, in: 0...1)
                }
                HStack {
                    Text("Trailing \(trailing * 100, specifier: "%.0f")%")
                    Slider(value: $trailing, in: 0...1)
                }
            }
            .padding()
        }
        .navigationTitle("OverlapHorizontal")
    }
}

struct OverlappingImageHorizontalExample_Previews: PreviewProvider {
    static var previews: some View {
        OverlappingImageHorizontalExample()
    }
}
