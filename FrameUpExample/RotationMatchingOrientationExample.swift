//
//  RotationMatchingOrientationExample.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2022-04-05.
//

import SwiftUI

struct RotationMatchingOrientationExample: View {
    func face(text: String) -> some View {
        VStack {
            Image(systemName: "face.smiling")
                .resizable()
                .scaledToFit()
                .frame(height: 40)
            Text(text)
        }
        .frame(width: 100, height: 100)
    }
    
    var body: some View {
        VStack {
            face(text: "Matches orientation.")
                .rotationMatchingOrientation()
            
            face(text: "Always Portrait")
                .rotationMatchingOrientation([.portrait])
            
            face(text: "Always Left")
                .rotationMatchingOrientation([.landscapeLeft])
            
            face(text: "Always Right")
                .rotationMatchingOrientation([.landscapeRight])
        }
    }
}

struct RotationMatchingOrientationExample_Previews: PreviewProvider {
    static var previews: some View {
        RotationMatchingOrientationExample()
    }
}
