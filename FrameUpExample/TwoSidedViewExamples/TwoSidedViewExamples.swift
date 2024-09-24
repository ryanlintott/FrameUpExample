//
//  TwoSidedViewExamples.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2023-05-01.
//

import SwiftUI

struct TwoSidedViewExamples: View {
    var body: some View {
        Section {
            NavigationLink(destination: TwoSidedViewExample()) {
                Label("TwoSidedView", systemImage: "arrow.uturn.right.square")
            }
            #if os(visionOS)
            NavigationLink(destination: TwoSidedVisionOSViewExample()) {
                Label("TwoSidedVisionOSView", systemImage: "arrow.uturn.right.square")
            }
            #else
            NavigationLink(destination: FlippingViewExample()) {
                Label("FlippingView", systemImage: "arrow.uturn.right.square")
            }
            #endif
        } header: {
            Text("TwoSidedView")
        }
    }
}

struct TwoSidedViewExamples_Previews: PreviewProvider {
    static var previews: some View {
        List {
            TwoSidedViewExamples()
        }
    }
}
