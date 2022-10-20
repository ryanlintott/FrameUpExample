//
//  VFlowExample.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2021-09-14.
//

import FrameUp
import SwiftUI

struct VFlowExample: View {
    @State private var items = ["These", "Items", "can be arranged", "into any", "layout", "you like", "with", "FrameUp"]
        .map { Item(id: UUID(), value: $0) }
    
    @State private var maxHeight: CGFloat = 300
    @State private var horizontalAlignment: FUHorizontalAlignment = .leading
    @State private var verticalAlignment: FUVerticalAlignment = .top
    
    var alignment: FUAlignment { .init(horizontal: horizontalAlignment, vertical: verticalAlignment)}
    
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                VFlow(alignment: alignment, maxHeight: maxHeight) {
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
                .frame(maxHeight: maxHeight, alignment: .top)
                .padding()
            }
            .animation(.default, value: items)
            .animation(.default, value: maxHeight)
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
                
                Stepper("Max Height \(maxHeight, specifier: "%.0F")", value: $maxHeight, in: 50...600, step: 50)
            }
            .padding()
        }
        .navigationTitle("VFlow")
    }
}

struct VFlowExample_Previews: PreviewProvider {
    static var previews: some View {
        VFlowExample()
    }
}
