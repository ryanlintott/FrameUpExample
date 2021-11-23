//
//  WidgetSizeExample.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2021-09-16.
//

import FrameUp
import SwiftUI

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
            Picker("WidgetSize", selection: $widgetSize) {
                ForEach(WidgetSize.supportedSizesForCurrentDevice, id: \.self) { widgetSize in
                    Text(widgetSize.rawValue)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            
            Spacer(minLength: 0)
            
            Color.blue
                .overlay(
                    VStack {
                        Text("Widget")
                            .bold()
                        
                        Text(sizeString)
                    }
                    .foregroundColor(.white)
                )
                .frame(size)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            
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
