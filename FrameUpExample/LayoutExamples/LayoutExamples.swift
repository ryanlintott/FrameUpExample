//
//  LayoutExamples.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2023-05-01.
//

import SwiftUI

struct LayoutExamples: View {
    var body: some View {
        Section {
            if #available(iOS 16, macOS 13, *) {
                NavigationLink(destination: LayoutThatFitsExample()) {
                    Label("LayoutThatFits", systemImage: "arrow.up.right.and.arrow.down.left.rectangle")
                }
            } else {
                UnavailableView(availableInLaterVersion: true)
            }
        } header: {
            Text("Layout")
        }
    }
}

struct LayoutExamples_Previews: PreviewProvider {
    static var previews: some View {
        List {
            LayoutExamples()
        }
    }
}
