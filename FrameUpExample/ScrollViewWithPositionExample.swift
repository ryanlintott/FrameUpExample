//
//  ScrollViewWithPositionExample.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2021-09-15.
//

import FrameUp
import SwiftUI

struct ScrollViewWithPositionExample: View {
    @State private var topOffset: CGFloat? = nil
    @State private var bottomOffset: CGFloat? = nil
    
    var body: some View {
        VStack {
            ScrollViewWithPosition(topOffset: $topOffset, bottomOffset: $bottomOffset, showsIndicators: true) {
                VStack {
                    ForEach(1...100, id: \.self) { i in
                        Text("\(i) Some Text")
                            .font(.title)
                    }
                }
            }
        }
        .overlay(Text("\(topOffset ?? 0) \(bottomOffset ?? 0)"))
    }
}

struct ScrollViewWithPositionExample_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewWithPositionExample()
    }
}
