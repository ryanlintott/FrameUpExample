//
//  ControlImageWidget.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2023-09-04.
//

import FrameUp
import WidgetKit
import SwiftUI

@available(iOS 18.0, *)
struct ControlImageWidget: ControlWidget {
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: "ControlImageWidget") {
            ControlWidgetButton(action: OpenApp()) {
                Label {
                    Text("Custom Image")
                } icon: {
                    ControlImage(.frameUpIconControl)
                }
            }
        }
    }
}

