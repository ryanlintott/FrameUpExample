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
        ScrollView(.horizontal) {
            HeightReader { height in
                VStack(spacing: 0) {
                    Text("This\ntext\nframe\nis\nset\nto\n70%\nof\nthe\nheight.")
                        .frame(height: height * 0.7)
                        .background(Color.green)
                    
                    Circle()
                }
                .foregroundColor(.white)
                .background(Color.blue)
                
                Text("\nThe\nHeightReader\nto\nthe\nleft\ndoes\nnot\nhave\na\nfixed\nwidth\nand\nwill\ngrow\nto\nfit\nthe\ncontent.")
                    .padding()
            }
        }
        .navigationTitle("HeightReader")
    }
}

struct HeightReaderExample_Previews: PreviewProvider {
    static var previews: some View {
        HeightReaderExample()
    }
}
