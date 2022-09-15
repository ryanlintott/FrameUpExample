//
//  HeightReaderExample.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2021-09-14.
//

import FrameUp
import SwiftUI

struct HeightReaderExample: View {
    @State private var percent = 0.7
    
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HeightReader { height in
                    VStack(spacing: 0) {
                        Text("This text frame is set to \(percent * 100, specifier: "%.0f")% of the height.")
                            .frame(height: height * percent)
                            .background(Color.green)
                        
                        Circle()
                    }
                    .foregroundColor(.white)
                    .background(Color.blue)
                }
            }
            
            Text("The HeightReader above does not have a fixed width and will fit the content.")
                .padding()
            
            HStack {
                Text("Percent \(percent * 100, specifier: "%.0f")%")
                Slider(value: $percent, in: 0...1)
            }
            .padding()
        }
        .navigationTitle("HeightReader")
    }
}

struct HeightReaderExample_Previews: PreviewProvider {
    static var previews: some View {
        HeightReaderExample()
    }
}
