//
//  ScrollViewWithPositionExample.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2021-09-15.
//

import FrameUp
import SwiftUI

struct ScrollViewWithPositionExample: View {
    @State private var edgeInsets: EdgeInsets? = nil
    @State private var bottomOffset: CGFloat? = nil
    
    var body: some View {
        VStack {
            ScrollViewWithPosition([.vertical, .horizontal], showsIndicators: true, edgeInsets: $edgeInsets) {
                VStack {
                    ForEach(1...10, id: \.self) { i in
                        Text("\(i) Some Text")
                            .font(.title)
                    }
                }
            }
            .background(Color.blue)
            
            HStack {
                VStack(alignment: .leading) {
                    Text("top: \(edgeInsets?.top ?? 0)")
                    Text("bottom: \(edgeInsets?.bottom ?? 0)")
                    Text("leading: \(edgeInsets?.leading ?? 0)")
                    Text("trailing: \(edgeInsets?.trailing ?? 0)")
                }
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("ScrollPosition")
    }
}

struct ScrollViewWithPositionExample_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewWithPositionExample()
    }
}
