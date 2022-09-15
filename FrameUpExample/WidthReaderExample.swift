//
//  WidthReaderExample.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2021-06-13.
//

import FrameUp
import SwiftUI

struct WidthReaderExample: View {
    @State private var percent = 0.7
    
    var body: some View {
        VStack {
            ScrollView {
                WidthReader { width in
                    HStack(spacing: 0) {
                        Text("This text frame is set to \(percent * 100, specifier: "%.0f")% of the width.")
                            .frame(width: width * percent)
                            .background(Color.green)
                        
                        Circle()
                    }
                }
                .foregroundColor(.white)
                .background(Color.blue)
            }
            
            Text("The WidthReader above does not have a fixed height and will fit the content.")
                .padding()
            
            HStack {
                Text("Percent \(percent * 100, specifier: "%.0f")%")
                Slider(value: $percent, in: 0...1)
            }
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
