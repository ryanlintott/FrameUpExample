//
//  WidgetFrameExample.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2021-11-23.
//

import FrameUp
import WidgetKit
import SwiftUI

struct WidgetFrameExample: View {
    var body: some View {
        WidgetFrame {
            ContainerRelativeShape()
                .overlay(
                    Text("ContainerRelativeShape()\n    .inset(by: 2)")
                        .font(.caption2)
                        .foregroundColor(.white)
                )
                .padding(2)
        }
    }
}

@available (iOS 15.0, *)
struct WidgetFrameExample_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(WidgetFamily.supportedFamiliesForCurrentDevice, id: \.self) { widgetFamily in
            WidgetFrameExample()
                .fixWidgetPreviewAlignmentBug(adjustment: 11.5)
                .previewContext(WidgetPreviewContext(family: widgetFamily))
        }
    }
}
