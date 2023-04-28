//
//  Examples.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2023-04-27.
//

import SwiftUI

struct Examples: View {
    var body: some View {
        Group {
            Group {
                NavigationLink(destination: WidthReaderExample()) {
                    Label("WidthReader", systemImage: "arrow.left.and.right.square")
                }
                
                NavigationLink(destination: HeightReaderExample()) {
                    Label("HeightReader", systemImage: "arrow.up.and.down.square")
                }
                
                NavigationLink(destination: SmartScrollViewExample()) {
                    Label("SmartScroll", systemImage: "scroll")
                }
                
                NavigationLink(destination: SmartScrollViewSimpleExample()) {
                    Label("SmartScrollSimple", systemImage: "scroll")
                }
                
                #if os(iOS)
                NavigationLink(destination: DoubleScrollTabViewExample()) {
                    Label("DoubleScrollTabView", systemImage: "scroll")
                }
                #endif
            }
            
            Group {
                NavigationLink(destination: AnyFULayoutExample()) {
                    Label("FULayout", systemImage: "rectangle.3.group")
                }
                
                NavigationLink(destination: HFlowExample()) {
                    Label("HFlow", systemImage: "arrow.forward.square")
                }
                
                NavigationLink(destination: HFlowSmartScrollViewExample()) {
                    Label("HFlowSmartScrollView", systemImage: "arrow.forward.square")
                }
                
                NavigationLink(destination: VFlowExample()) {
                    Label("VFlow", systemImage: "arrow.down.square")
                }
                
                NavigationLink(destination: CustomFULayoutExample()) {
                    Label("CustomFULayout", systemImage: "rectangle.3.group.bubble.left")
                }
            }
            
            Group {
                NavigationLink(destination: TwoSidedViewExample()) {
                    Label("TwoSidedView", systemImage: "arrow.2.squarepath")
                }
                
                NavigationLink(destination: FlippingViewExample()) {
                    Label("FlippingView", systemImage: "arrow.uturn.right.square")
                }
                
                NavigationLink(destination: OverlappingImageHorizontalExample()) {
                    Label("HOverlap", systemImage: "square.righthalf.fill")
                }
                
                NavigationLink(destination: OverlappingImageVerticalExample()) {
                    Label("VOverlap", systemImage: "square.bottomhalf.fill")
                }
                
                NavigationLink(destination: RelativePaddingExample()) {
                    Label("RelativePadding", systemImage: "percent")
                }
            }
            
            Group {
                NavigationLink(destination: ScaledToFrameExample()) {
                    Label("ScaledToFrameExample", systemImage: "rectangle.and.arrow.up.right.and.arrow.down.left")
                }
                
                #if os(iOS)
                NavigationLink(destination: TabMenuViewExample2()) {
                    Label("TabMenu", systemImage: "squares.below.rectangle")
                }
                
                NavigationLink(destination: AutoRotatingViewExample()) {
                    Label("AutoRotatingView", systemImage: "arrow.turn.up.forward.iphone")
                }
                
                NavigationLink(destination: WidgetSizeExample()) {
                    Label("WidgetSize", systemImage: "rectangle.3.offgrid")
                }
                                        
                NavigationLink(destination: WidgetDemoFrameExample()) {
                    Label("WidgetDemoFrame", systemImage: "rectangle.3.offgrid")
                }
                #endif
            }
        }
    }
}

struct Examples_Previews: PreviewProvider {
    static var previews: some View {
        Examples()
    }
}
