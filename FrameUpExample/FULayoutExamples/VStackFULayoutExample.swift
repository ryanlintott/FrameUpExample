//
//  VStackFULayoutExample.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2023-05-12.
//

import FrameUp
import SwiftUI

struct VStackFULayoutExample: View {
    @State private var items: [Item] = .examples
    @State private var horizontalAlignment: FUHorizontalAlignment = .center
    @State private var maxWidth: CGFloat = 300
    
    var body: some View {
        VStack {
            Text("Similar to VStack but will always grow vertically")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            Color.clear.overlay(
                ScrollView(.vertical) {
                    VStackFULayout(alignment: horizontalAlignment, maxWidth: maxWidth) {
                        ForEach(items) { item in
                            Text(item.value)
                                .padding(12)
                                .foregroundColor(.white)
                                .frame(height: CGFloat(item.value.count) * 6)
                                .background(Color.blue)
                                .cornerRadius(12)
                        }
                    }
                    .background(Color.gray.opacity(0.5))
                    .border(Color.red)
                    .frame(maxWidth: maxWidth)
                    .padding()
                }
                .animation(.default, value: items)
                .animation(.default, value: maxWidth)
                .animation(.default, value: horizontalAlignment)
            )
            
            VStack {
                HStack {
                    Button("Remove Item") { if !items.isEmpty { items.removeLast() } }
                        .padding()
                    Button("Add Item") { items.append(Item(value: items.randomElement()?.value ?? "New Item")) }
                        .padding()
                }

                Picker("Horizontal Alignment", selection: $horizontalAlignment) {
                    ForEach(FUHorizontalAlignment.allCases) {
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(.segmented)

                Stepper("Max Width \(maxWidth, specifier: "%.0F")", value: $maxWidth, in: 50...600, step: 50)
            }
            .padding()
        }
        .navigationTitle("VStackFULayout")
    }
}

struct VStackFULayoutExample_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VStackFULayoutExample()
        }
    }
}
