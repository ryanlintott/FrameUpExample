//
//  ContentView.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2021-09-14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HFlowExample()
                .tabItem {
                    Label("HFlow", systemImage: "arrow.forward.square")
                }
            
            VFlowExample()
                .tabItem {
                    Label("VFlow", systemImage: "arrow.down.square")
                }
            
            ScrollViewWithPositionExample()
                .tabItem {
                    Label("Scroll", systemImage: "scroll")
                }
            
            OverlappingImageVerticalExample()
                .tabItem {
                    Label("VOverlap", systemImage: "square.2.stack.3d.top.fill")
                }
            
            OverlappingImageHorizontalExample()
                .tabItem {
                    Label("HOverlap", systemImage: "square.2.stack.3d.bottom.fill")
                }
            
            WidthReaderExample()
                .tabItem {
                    Label("Width", systemImage: "arrow.left.and.right.square")
                }
            
            HeightReaderExample()
                .tabItem {
                    Label("Height", systemImage: "arrow.up.and.down.square")
                }
            
            TabMenuViewExample()
                .tabItem {
                    Label("TabMenu", systemImage: "squares.below.rectangle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
