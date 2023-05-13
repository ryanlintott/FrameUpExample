//
//  WidgetSizeExample.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2021-09-16.
//

import FrameUp
import SwiftUI

#if os(iOS)
struct WidgetSizeExample: View {
    @State private var widgetSize: WidgetSize = .small

    var size: CGSize {
        widgetSize.sizeForCurrentDevice()
    }
    
    var sizeString: String {
        String(format: "%.1f", size.width) + " x " + String(format: "%.1f", size.height)
    }
    
    var body: some View {
        VStack {
            Text("Sizes below are for this device. Widget sizes for other devices can be found by supplying the screen size.")
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
            
            Color.blue
                .overlay(
                    Text(sizeString)
                        .foregroundColor(.white)
                )
                .frame(size)
            
            Spacer()
        }
        .navigationTitle("WidgetSize")
    }
}

struct WidgetSizeExample_Previews: PreviewProvider {
    static var previews: some View {
        WidgetSizeExample()
    }
}
#endif
