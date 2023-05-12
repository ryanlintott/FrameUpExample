//
//  WidgetDemoFrameExample.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2021-11-22.
//

import FrameUp
import SwiftUI

#if os(iOS)
struct WidgetDemoFrameExample: View {
    @State private var widgetSize: WidgetSize = .small
    
    var homeScreenSize: CGSize {
        widgetSize.sizeForCurrentDevice(iPadTarget: .homeScreen)
    }
    
    var designCanvasSize: CGSize {
        widgetSize.sizeForCurrentDevice(iPadTarget: .designCanvas)
    }
    
    func sizeString(_ size: CGSize) -> String {
        String(format: "%.1f", size.width) + " x " + String(format: "%.1f", size.height)
    }
    
    var body: some View {
        VStack {
            Picker("WidgetSize", selection: $widgetSize) {
                ForEach(WidgetSize.supportedSizesForCurrentDevice, id: \.self) { widgetSize in
                    Text(widgetSize.rawValue)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            
            Spacer(minLength: 0)
            
            WidgetDemoFrame(widgetSize) { size, cornerRadius in
                Color.blue
                    .overlay(
                        VStack {
                            Text(UIDevice.current.userInterfaceIdiom == .pad ? "designCanvas: \(sizeString(size))" : "")

                            Spacer()
                            
                            Text("homeScreen: \(sizeString(homeScreenSize))")
                        }
                    )
            }
            .overlay(
                GeometryReader { proxy in
                    Color.clear
                        .overlay(
                            Text("actual size: \(sizeString(proxy.size))")
                        )
                }
            )
            .foregroundColor(.white)
            
            Spacer()
        }
        .navigationTitle("WidgetSize")
    }
}

struct WidgetDemoFrameExample_Previews: PreviewProvider {
    static var previews: some View {
        WidgetDemoFrameExample()
    }
}
#endif
