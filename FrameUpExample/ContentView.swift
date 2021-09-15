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
                    Label("HFlow", systemImage: "arrow.forward.square.fill")
                }
            
            VFlowExample()
                .tabItem {
                    Label("VFlow", systemImage: "arrow.down.square.fill")
                }
            
            ScrollViewWithPositionExample()
                .tabItem {
                    Label("Scroll", systemImage: "scroll")
                }
            
            WidthReaderExample()
                .tabItem {
                    Label("Width", systemImage: "arrow.left.and.right.square")
                }
            
            HeightReaderExample()
                .tabItem {
                    Label("Height", systemImage: "arrow.up.and.down.square")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
