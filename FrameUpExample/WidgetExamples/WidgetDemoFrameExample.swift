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
            Text("Demo frames below are sized for this device. Demo frames for other devices can be created by supplying screen size. iPad demo frames will provide an accurate dimension for the content and scale to the size shown on the home screen. Corner radius used is just an estimate as Apple does not supply these values.")
                .font(.footnote)
                .padding()
            
            Picker("WidgetSize", selection: $widgetSize) {
                ForEach(WidgetSize.supportedSizesForCurrentDevice, id: \.self) { widgetSize in
                    Text(widgetSize.rawValue)
                }
            }
            .pickerStyle(.menu)
            .padding()
            
            Spacer(minLength: 0)
            
            WidgetDemoFrame(widgetSize) { size, cornerRadius in
                Color.blue
            }
            .foregroundColor(.white)
            
            Spacer()
        }
        .navigationTitle("WidgetDemoFrame")
    }
}

struct WidgetDemoFrameExample_Previews: PreviewProvider {
    static var previews: some View {
        WidgetDemoFrameExample()
    }
}
#endif
