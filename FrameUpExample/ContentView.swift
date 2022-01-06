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
            VStack {
                Image("FrameUp-logo")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 400)
                    .padding()
                
                Form {
                    Group {
                        NavigationLink(destination: WidthReaderExample()) {
                            Label("WidthReader", systemImage: "arrow.left.and.right.square")
                        }
                        
                        NavigationLink(destination: HeightReaderExample()) {
                            Label("HeightReader", systemImage: "arrow.up.and.down.square")
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
                        
                        NavigationLink(destination: SmartScrollViewExample()) {
                            Label("SmartScroll", systemImage: "scroll")
                        }
                        
                        NavigationLink(destination: TagViewExample()) {
                            Label("TagView", systemImage: "capsule")
                        }
                        
                        NavigationLink(destination: TagViewForScrollViewExample()) {
                            Label("TagViewForScrollView", systemImage: "capsule")
                        }
                        
                        NavigationLink(destination: ScaledToFrameExample()) {
                            Label("ScaledToFrameExample", systemImage: "rectangle.and.arrow.up.right.and.arrow.down.left")
                        }
                        
                        NavigationLink(destination: WidgetSizeExample()) {
                            Label("WidgetSize", systemImage: "rectangle.3.offgrid")
                        }
                        
                        NavigationLink(destination: WidgetDemoFrameExample()) {
                            Label("WidgetDemoFrame", systemImage: "rectangle.3.offgrid")
                        }
                    }
                }
            }
            .navigationTitle("FrameUp")
            .navigationBarHidden(true)
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
