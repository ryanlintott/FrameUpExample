//
//  SmartScrollViewExample.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2021-09-24.
//

import FrameUp
import SwiftUI

struct SmartScrollViewExample: View {
    @State private var showSettings = false
    
    @State private var numItems = 20
    @State private var exampleText = "Example"
    @State private var vertical = true
    @State private var horizontal = false
    @State private var showsIndicators = true
    @State private var optionalScrolling = true
    @State private var shrinkToFit = true
    @State private var edgeInsets: EdgeInsets? = nil
    
    var items: [(Int, String)] {
        Array(1...numItems).map { ($0, "\($0) \(exampleText)") }
    }
    
    var axes: Axis.Set {
        var axes: Axis.Set = []
        if vertical {
            axes.update(with: .vertical)
        }
        if horizontal {
            axes.update(with: .horizontal)
        }
        return axes
    }
    
    var body: some View {
        Color.clear
            .overlay(
                SmartScrollView(axes, showsIndicators: showsIndicators, optionalScrolling: optionalScrolling, shrinkToFit: shrinkToFit, edgeInsets: $edgeInsets) {
                    VStack {
                        ForEach(items, id: \.0) { (i, text) in
                            Text(text)
                                .font(.title)
                        }
                    }
                }
                    .background(Color.gray.opacity(0.5))
                , alignment: .center
            )
            .padding()
            .overlay(
                VStack(alignment: .trailing) {
                    if let edgeInsets = edgeInsets {
                        Text("top inset: \(edgeInsets.top)")
                        Text("bottom inset: \(edgeInsets.bottom)")
                        Text("leading inset: \(edgeInsets.leading)")
                        Text("trailing inset: \(edgeInsets.trailing)")
                    }
                }
                .foregroundColor(.red)
                , alignment: .bottomTrailing
            )
            .toolbar {
                Button {
                    showSettings = true
                } label: {
                    Image(systemName: "gear")
                }
            }
            .navigationTitle("SmartScrollView")
            .sheet(isPresented: $showSettings) {
                Form {
                    Stepper("Number of Items", value: $numItems, in: 1...100)
                    TextField("Example Text", text: $exampleText)
                        .textFieldStyle(.roundedBorder)
                    Toggle("Scroll Vertical", isOn: $vertical)
                    Toggle("Scroll Horizontal", isOn: $horizontal)
                    Toggle("Optional Scrolling", isOn: $optionalScrolling)
                    Toggle("Shrink to Fit", isOn: $shrinkToFit)
                    
                    Button("Close") {
                        
                    }
                }
            }
    }
}

struct SmartScrollViewExample_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SmartScrollViewExample()
        }
    }
}
