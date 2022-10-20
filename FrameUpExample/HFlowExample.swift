//
//  HFlowLayoutExample.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2022-07-18.
//

import FrameUp
import SwiftUI

struct HFlowExample: View {
    @State private var items = ["These", "Items", "can be arranged", "into any", "layout", "you like", "with", "FrameUp"]
        .map { Item(id: UUID(), value: $0) }
    
    @State private var maxWidth: CGFloat = 300
    @State private var horizontalAlignment: FUHorizontalAlignment = .leading
    @State private var verticalAlignment: FUVerticalAlignment = .top
    
    var alignment: FUAlignment { .init(horizontal: horizontalAlignment, vertical: verticalAlignment)}
    
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                HFlow(alignment: alignment, maxWidth: maxWidth) {
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
                .padding()
            }
            .animation(.default, value: items)
            .animation(.default, value: maxWidth)
            .animation(.default, value: alignment)
            
            Spacer()
            
            VStack {
                HStack {
                    Button("Remove Item") { if !items.isEmpty { items.removeLast() } }
                        .padding()
                    Button("Add Item") { items.append(Item(value: items.randomElement()?.value ?? "New Item")) }
                        .padding()
                }
                
                Picker("Vertical Alignment", selection: $verticalAlignment) {
                    ForEach(FUVerticalAlignment.allCases) {
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                
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
        .navigationTitle("VFlow")
    }
}

struct HFlowExample_Previews: PreviewProvider {
    static var previews: some View {
        HFlowExample()
    }
}
