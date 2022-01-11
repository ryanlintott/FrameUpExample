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
        ScrollView {
            WidthReader { width in
                HStack(spacing: 0) {
                    Text("This text frame is set to 70% of the width.")
                        .frame(width: width * 0.7)
                        .background(Color.green)
                    
                    Circle()
                }
            }
            .foregroundColor(.white)
            .background(Color.blue)
            
            Text("The WidthReader above does not have a fixed height and will grow to fit the content.")
                .padding()
        }
        .navigationTitle("WidthReader")
    }
}

struct WidthReaderExample_Previews: PreviewProvider {
    static var previews: some View {
        WidthReaderExample()
    }
}
