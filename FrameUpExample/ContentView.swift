//
//  ContentView.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2021-09-14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Form {
                Group {
                    NavigationLink(destination: WidthReaderExample()) {
                        Label("Width", systemImage: "arrow.left.and.right.square")
                    }
                    
                    NavigationLink(destination: HeightReaderExample()) {
                        Label("Height", systemImage: "arrow.up.and.down.square")
                    }
                    
                    NavigationLink(destination: HFlowExample()) {
                        Label("HFlow", systemImage: "arrow.forward.square")
                    }
                    
                    NavigationLink(destination: VFlowExample()) {
                        Label("VFlow", systemImage: "arrow.down.square")
                    }
                    
                    NavigationLink(destination: OverlappingImageHorizontalExample()) {
                        Label("HOverlap", systemImage: "square.righthalf.fill")
                    }
                    
                    NavigationLink(destination: OverlappingImageVerticalExample()) {
                        Label("VOverlap", systemImage: "square.bottomhalf.fill")
                    }
                }
                
                Group {
                    NavigationLink(destination: TabMenuViewExample2()) {
                        Label("TabMenu", systemImage: "squares.below.rectangle")
                    }
                    
                    NavigationLink(destination: ScrollViewWithPositionExample()) {
                        Label("Scroll", systemImage: "scroll")
                    }
                    
                    NavigationLink(destination: TagViewExample()) {
                        Label("TagView", systemImage: "capsule")
                    }
                    
                    NavigationLink(destination: TagViewForScrollViewExample()) {
                        Label("TagViewForScrollView", systemImage: "capsule")
                    }
                    
                    NavigationLink(destination: WidgetSizeExample()) {
                        Label("WidgetSize", systemImage: "rectangle.3.offgrid")
                    }
                }
            }
            .navigationTitle("FrameUp")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
