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
    
    @State private var numItems = 30
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
        SmartScrollView(axes, showsIndicators: showsIndicators, optionalScrolling: optionalScrolling, shrinkToFit: shrinkToFit) {
            VStack {
                ForEach(items, id: \.0) { (i, text) in
                    VStack {
                        Text(text)
                            .font(.title)
//                            .frame(maxWidth: 500)
                    }
                }
            }
        } onScroll: { edgeInsets in
            self.edgeInsets = edgeInsets
        }
        .background(Color.gray.opacity(0.5))
        .padding(30)
        .overlay(
            VStack {
                if let edgeInsets = edgeInsets {
                    Text("\(edgeInsets.top)")
                        .fixedSize()
                    Spacer()
                    Text("\(edgeInsets.bottom)")
                        .fixedSize()
                }
            }
                .foregroundColor(.red)
        )
        .overlay(
            HStack {
                if let edgeInsets = edgeInsets {
                    Text("\(edgeInsets.leading)")
                        .fixedSize()
                        .rotationEffect(.degrees(-90))
                        .offset(x: -20)
                    Spacer()
                    Text("\(edgeInsets.trailing)")
                        .fixedSize()
                        .rotationEffect(.degrees(-90))
                        .offset(x: 20)
                }
            }
                .foregroundColor(.red)
        )
        .toolbar {
            Button {
                showSettings = true
            } label: {
                Image(systemName: "gear")
            }
        }
        .navigationTitle("SmartScrollView")
        // padding of at least 1 point is needed when inside a navigation stack as it will resize the available space
        .padding(.top, 1)
        .sheet(isPresented: $showSettings) {
            Form {
                Stepper("Items: \(numItems)", value: $numItems, in: 1...100)
                TextField("Example Text", text: $exampleText)
                    .textFieldStyle(.roundedBorder)
                Toggle("Scroll Vertical", isOn: $vertical)
                Toggle("Scroll Horizontal", isOn: $horizontal)
                Toggle("Optional Scrolling", isOn: $optionalScrolling)
                Toggle("Shrink to Fit", isOn: $shrinkToFit)
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
