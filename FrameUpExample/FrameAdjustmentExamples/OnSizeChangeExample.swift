//
//  OnSizeChangeExample.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2021-11-22.
//

import FrameUp
import SwiftUI

struct OnSizeChangeExample: View {
    @State private var size: CGSize = .zero
    
    var body: some View {
        Text("Hello, World!")
            .padding(100)
            .background(Color.blue)
            .onSizeChange { size in
                self.size = size
            }
            .overlay(
                Text("size: \(size.width) x \(size.height)")
                , alignment: .bottom
            )
    }
}

struct OnSizeChangeExample_Previews: PreviewProvider {
    static var previews: some View {
        OnSizeChangeExample()
    }
}
