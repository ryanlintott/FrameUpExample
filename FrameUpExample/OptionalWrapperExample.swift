//
//  OptionalWrapperExample.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2021-09-24.
//

import FrameUp
import SwiftUI

struct OptionalWrapperExample: View {
    @State private var wrap = true
    
    var body: some View {
        VStack {
            Toggle("Wrap", isOn: $wrap)
            
            OptionalWrapper(wrap) { content in
                ScrollView(content: content)
            } content: {
                Text("Hello")
            }
        }
    }
}

struct OptionalWrapperExample_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView([.vertical]) {
            Text("Hello")
        }
        OptionalWrapperExample()
    }
}
