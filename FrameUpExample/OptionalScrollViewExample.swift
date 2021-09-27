//
//  OptionalScrollViewExample.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2021-09-24.
//

import FrameUp
import SwiftUI

struct OptionalScrollViewExample: View {
    var body: some View {
        VStack {
            OptionalScrollView {
                VStack(alignment: .leading) {
                    ForEach(1...100, id: \.self) { i in
                        Text("\(i) Some Text that is very very very long")
                            .font(.title)
                    }
                }
            }
            .background(Color.blue)
            
            Text("Below scrollview")
            
        }
        
    }
}

struct OptionalScrollViewExample_Previews: PreviewProvider {
    static var previews: some View {
        OptionalScrollViewExample()
    }
}
