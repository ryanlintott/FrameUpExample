//
//  OverlappingImageExample.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2021-09-15.
//

import FrameUp
import SwiftUI

struct OverlappingImageExample: View {
    let previewImage = UIImage(systemName: "star.square")!
    let image = Image(systemName: "star.square")
    
    var body: some View {
        Group {
            VStack(spacing: 0) {
                Text("Overlapping Image")
                    .font(.system(size: 50))
                Rectangle()
                    .frame(height: 5)
                
                OverlappingImage(image, aspectRatio: 1.0, top: 0.1, bottom: 0.25)
                    .foregroundColor(.blue.opacity(0.5))
                    .padding(.horizontal, 50)
                    .zIndex(1)
                
                VStack {
                    Text("The image above will overlap content above and below with an inset based on a percent of the image height. This allows the overlap to occur in the same location regardless of scale.")
                        .padding(20)
                }
                .background(Color.gray)
                .padding(3)
                .background(Color.red)
            }
            .frame(width: 400, height: 400)
            .previewLayout(.sizeThatFits)
            
            
            HStack(spacing: 0) {
                Text("Overlapping Image")
                    .font(.system(size: 20))
                Rectangle()
                    .frame(width: 5)
                
                OverlappingImage(image, aspectRatio: 1.0, left: 0.1, right: 0.25)
                    .foregroundColor(.blue.opacity(0.5))
                    .padding(.vertical, 50)
                    .zIndex(1)
                
                VStack {
                    Text("The image to the left will overlap content to the left and right with an inset based on a percent of the image width.")
                        .padding(20)
                }
                .background(Color.gray)
                .padding(3)
                .background(Color.red)
            }
            .frame(width: 400, height: 200)
            .previewLayout(.sizeThatFits)
        }
    }
}

struct OverlappingImageExample_Previews: PreviewProvider {
    static var previews: some View {
        OverlappingImageExample()
    }
}
