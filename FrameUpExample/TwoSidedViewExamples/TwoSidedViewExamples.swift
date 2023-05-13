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
            
            NavigationLink(destination: FlippingViewExample()) {
                Label("FlippingView", systemImage: "arrow.uturn.right.square")
            }
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
