//
//  WidgetRelativeShape.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2021-11-24.
//

import FrameUp
import SwiftUI
import WidgetKit

struct WidgetRelativeShapeExample: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "arrow.up.left")
                Spacer()
                Image(systemName: "arrow.up.right")
            }
            Spacer()
            Text("Widget Relative Shape (fixes iPad corner issues)")
            Spacer()
            HStack {
                Image(systemName: "arrow.down.left")
                Spacer()
                Image(systemName: "arrow.down.right")
            }
        }
        .padding(6)
        .foregroundColor(.white)
        .background(.blue)
        .clipShape(WidgetRelativeShape(.systemSmall))
        .background(
            ContainerRelativeShape()
                .fill(.red)
        )
        .padding(1)
    }
}

struct WidgetRelativeShape_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            // broken on iPads
            ContainerRelativeShape()
                .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                .foregroundColor(.red)
                .overlay(
                    Text("Corner radius not correct on iPads")
                )
                .padding(1)
            
            // fixed on all devices
            WidgetRelativeShapeExample()
        }
        .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
