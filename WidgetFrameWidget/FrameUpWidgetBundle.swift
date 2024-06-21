//
//  FrameUpWidgetBundle.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2023-09-04.
//

import Foundation
import SwiftUI

@main
struct WidgetLauncher {
    static func main() {
        if #available(iOS 18, *) {
            FrameUpWidgetBundle.main()
        } else if #available(iOS 16, *) {
            FrameUpWidgetBundleiOS16.main()
        } else {
            FrameUpWidgetBundleiOS14.main()
        }
    }
}

@available(iOS 18, *)
struct FrameUpWidgetBundle: WidgetBundle {
    var body: some Widget {
        WidgetFrameWidget()
        
        InlineImageWidget()
        
        ControlImageWidget()
    }
}

@available(iOS 16, *)
struct FrameUpWidgetBundleiOS16: WidgetBundle {
    var body: some Widget {
        WidgetFrameWidget()
        
        InlineImageWidget()
    }
}

struct FrameUpWidgetBundleiOS14: WidgetBundle {
    var body: some Widget {
        WidgetFrameWidget()
    }
}
