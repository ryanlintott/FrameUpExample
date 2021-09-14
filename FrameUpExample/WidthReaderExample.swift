//
//  WidthReaderExample.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2021-06-13.
//

import FrameUp
import SwiftUI

struct WidthReaderExample: View {
    var body: some View {
        WidthReader { width in
            Text("\(width)")
                .background(Color.blue)
            
            Text("<                                     >")
                .overlay(
                    WidthReader(alignment: .center) { width in
                        Text("\(width)")
                            .background(Color.red)
                    }
                )
        }
    }
}

struct WidthReaderExample_Previews: PreviewProvider {
    static var previews: some View {
        WidthReaderExample()
    }
}
