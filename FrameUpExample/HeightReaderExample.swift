//
//  HeightReaderExample.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2021-09-14.
//

import FrameUp
import SwiftUI

struct HeightReaderExample: View {
    var body: some View {
        HeightReader { height in
            Text("\(height)")
                .background(Color.blue)
            
            Text("^\n\n\n\n\n\n\nv")
                .frame(width: 100)
                .overlay(
                    HeightReader(alignment: .center) { height in
                        Text("\(height)")
                            .background(Color.red)
                    }
                )
        }
    }
}

struct HeightReaderExample_Previews: PreviewProvider {
    static var previews: some View {
        HeightReaderExample()
    }
}
