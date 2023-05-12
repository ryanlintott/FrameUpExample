//
//  FULayoutExamples.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2023-05-01.
//

import SwiftUI

struct FULayoutExamples: View {
    @ViewBuilder
    var body: some View {
        Section {
            NavigationLink(destination: HFlowExample()) {
                Label("HFlow", systemImage: "arrow.forward.square")
            }
            
            NavigationLink(destination: VFlowExample()) {
                Label("VFlow", systemImage: "arrow.down.square")
            }
            
            NavigationLink(destination: HMasonryExample()) {
                Label("HMasonry", systemImage: "arrow.forward.square")
            }
            
            NavigationLink(destination: HMasonryAspectRatioExample()) {
                Label("HMasonry Aspect Ratio", systemImage: "arrow.forward.square")
            }
            
            NavigationLink(destination: VMasonryExample()) {
                Label("VMasonry", systemImage: "arrow.down.square")
            }
            
            NavigationLink(destination: VMasonryAspectRatioExample()) {
                Label("VMasonry Aspect Ratio", systemImage: "arrow.down.square")
            }
        } header: {
            Text("FULayout")
        }
            
        Section {
            NavigationLink(destination: AnyFULayoutSimpleExample()) {
                Label("AnyFULayout Simple", systemImage: "rectangle.3.group")
            }
            
            NavigationLink(destination: AnyFULayoutExample()) {
                Label("AnyFULayout", systemImage: "rectangle.3.group")
            }
            
            NavigationLink(destination: AnyFULayoutHorizontalExample()) {
                Label("AnyFULayout Horizontal", systemImage: "rectangle.3.group")
            }
        } header: {
            Text("AnyFULayout")
        }
            
        Section {
            Group {
                NavigationLink(destination: FUViewThatFitsExample()) {
                    Label("FUViewThatFits", systemImage: "arrow.up.right.and.arrow.down.left.rectangle")
                }
                
                NavigationLink(destination: FULayoutThatFitsExample()) {
                    Label("FULayoutThatFits", systemImage: "arrow.up.right.and.arrow.down.left.rectangle")
                }
            }
        } header: {
            Text("FUViewThatFits")
        }
        
        Section {
            NavigationLink(destination: CustomFULayoutExample()) {
                Label("CustomFULayout", systemImage: "rectangle.3.group.bubble.left")
            }
        } header: {
            Text("FULayout Custom")
        }
    }
}

struct FULayoutExamples_Previews: PreviewProvider {
    static var previews: some View {
        List {
            FULayoutExamples()
        }
    }
}
