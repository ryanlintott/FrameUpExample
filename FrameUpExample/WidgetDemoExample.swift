//
//  WidgetDemoExample.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2021-09-16.
//

import FrameUp
import SwiftUI
import WidgetKit

struct WidgetDemoExample: View {
    @State private var widgetFamily: WidgetFamily = .systemSmall

    var body: some View {
        VStack {
            Picker("WidgetFamily", selection: $widgetFamily) {
                ForEach(WidgetFamily.supportedFamiliesForCurrentDevice, id: \.self) { widgetFamily in
                    Text("\(widgetFamily.description)")
                }
            }
            .pickerStyle(.wheel)
            
            Spacer()
            
            Color.blue
                .overlay(
                    Text("Widget")
                        .bold()
                        .foregroundColor(.white)
                )
                .frame(widgetFamily.sizeForCurrentDevice())
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            
            Spacer()
        }
        .navigationTitle("WidgetDemo")
    }
}

struct WidgetDemoExample_Previews: PreviewProvider {
    static var previews: some View {
        WidgetDemoExample()
    }
}
