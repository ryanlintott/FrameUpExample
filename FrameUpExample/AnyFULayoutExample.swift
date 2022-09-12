//
//  AnyFULayoutExample.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2022-07-18.
//

import FrameUp
import SwiftUI

fileprivate func exampleLayouts(size: CGSize) -> [AnyFULayout] {
    [
        AnyFULayout(VFlow(alignment: .topLeading, maxHeight: size.height)),
        AnyFULayout(VFlow(alignment: .top, maxHeight: size.height)),
        AnyFULayout(VFlow(alignment: .topTrailing, maxHeight: size.height)),
        AnyFULayout(VFlow(alignment: .leading, maxHeight: size.height)),
        AnyFULayout(VFlow(alignment: .center, maxHeight: size.height)),
        AnyFULayout(VFlow(alignment: .trailing, maxHeight: size.height)),
        AnyFULayout(VFlow(alignment: .bottomLeading, maxHeight: size.height)),
        AnyFULayout(VFlow(alignment: .bottom, maxHeight: size.height)),
        AnyFULayout(VFlow(alignment: .bottomTrailing, maxHeight: size.height)),

        AnyFULayout(VMasonry(alignment: .topLeading, columns: 3, maxWidth: size.width)),
        AnyFULayout(VMasonry(alignment: .top, columns: 3, maxWidth: size.width)),
        AnyFULayout(VMasonry(alignment: .topTrailing, columns: 3, maxWidth: size.width)),
        AnyFULayout(VMasonry(alignment: .leading, columns: 3, maxWidth: size.width)),
        AnyFULayout(VMasonry(alignment: .center, columns: 3, maxWidth: size.width)),
        AnyFULayout(VMasonry(alignment: .trailing, columns: 3, maxWidth: size.width)),
        AnyFULayout(VMasonry(alignment: .bottomLeading, columns: 3, maxWidth: size.width)),
        AnyFULayout(VMasonry(alignment: .bottom, columns: 3, maxWidth: size.width)),
        AnyFULayout(VMasonry(alignment: .bottomTrailing, columns: 3, maxWidth: size.width)),
        
        AnyFULayout(VStackFULayout(alignment: .leading, maxWidth: size.width)),
        AnyFULayout(VStackFULayout(alignment: .center, maxWidth: size.width)),
        AnyFULayout(VStackFULayout(alignment: .trailing, maxWidth: size.width)),
        
        AnyFULayout(HFlow(alignment: .topLeading, maxWidth: size.width)),
        AnyFULayout(HFlow(alignment: .top, maxWidth: size.width)),
        AnyFULayout(HFlow(alignment: .topTrailing, maxWidth: size.width)),
        AnyFULayout(HFlow(alignment: .leading, maxWidth: size.width)),
        AnyFULayout(HFlow(alignment: .center, maxWidth: size.width)),
        AnyFULayout(HFlow(alignment: .trailing, maxWidth: size.width)),
        AnyFULayout(HFlow(alignment: .bottomLeading, maxWidth: size.width)),
        AnyFULayout(HFlow(alignment: .bottom, maxWidth: size.width)),
        AnyFULayout(HFlow(alignment: .bottomTrailing, maxWidth: size.width)),
        
        AnyFULayout(HMasonry(alignment: .topLeading, rows: 3, maxHeight: size.height)),
        AnyFULayout(HMasonry(alignment: .top, rows: 3, maxHeight: size.height)),
        AnyFULayout(HMasonry(alignment: .topTrailing, rows: 3, maxHeight: size.height)),
        AnyFULayout(HMasonry(alignment: .leading, rows: 3, maxHeight: size.height)),
        AnyFULayout(HMasonry(alignment: .center, rows: 3, maxHeight: size.height)),
        AnyFULayout(HMasonry(alignment: .trailing, rows: 3, maxHeight: size.height)),
        AnyFULayout(HMasonry(alignment: .bottomLeading, rows: 3, maxHeight: size.height)),
        AnyFULayout(HMasonry(alignment: .bottom, rows: 3, maxHeight: size.height)),
        AnyFULayout(HMasonry(alignment: .bottomTrailing, rows: 3, maxHeight: size.height)),
        
        AnyFULayout(HStackFULayout(alignment: .top, maxHeight: size.height)),
        AnyFULayout(HStackFULayout(alignment: .center, maxHeight: size.height)),
        AnyFULayout(HStackFULayout(alignment: .bottom, maxHeight: size.height)),
        
        AnyFULayout(ZStackFULayout(alignment: .topLeading, maxWidth: size.width, maxHeight: size.height)),
        AnyFULayout(ZStackFULayout(alignment: .top, maxWidth: size.width, maxHeight: size.height)),
        AnyFULayout(ZStackFULayout(alignment: .topTrailing, maxWidth: size.width, maxHeight: size.height)),
        AnyFULayout(ZStackFULayout(alignment: .leading, maxWidth: size.width, maxHeight: size.height)),
        AnyFULayout(ZStackFULayout(alignment: .center, maxWidth: size.width, maxHeight: size.height)),
        AnyFULayout(ZStackFULayout(alignment: .trailing, maxWidth: size.width, maxHeight: size.height)),
        AnyFULayout(ZStackFULayout(alignment: .bottomLeading, maxWidth: size.width, maxHeight: size.height)),
        AnyFULayout(ZStackFULayout(alignment: .bottom, maxWidth: size.width, maxHeight: size.height)),
        AnyFULayout(ZStackFULayout(alignment: .bottomTrailing, maxWidth: size.width, maxHeight: size.height))
    ]
}

struct AnyFULayoutExample: View {
    var body: some View {
        VStack {
            TabView {
                AnyFULayout_ViewExample()
                    .tabItem { Label("Layout", systemImage: "rectangle.3.group") }
                
                AnyFULayoutForEachExample()
                    .tabItem { Label(".forEach", systemImage: "list.dash") }
            }
        }
    }
}

struct AnyFULayout_ViewExample: View {
    @State private var items = ["These", "Items", "can be arranged", "into any", "layout", "you like", "with", "FrameUp"]
        .map { Item(id: UUID(), value: $0) }
    @State private var layoutIndex = 0
    @State private var layoutName: String = "FULayout"
    
    @State private var layoutDirection: LayoutDirection = .leftToRight
    var layoutDirectionImageName: String {
        switch layoutDirection {
        case .rightToLeft: return "arrow.right"
        default: return "arrow.left"
        }
    }
    
    var body: some View {
        VStack {
            Text(layoutName)
                .font(.subheadline)
            
            Spacer()
            
            GeometryReader { proxy in
                let layouts = exampleLayouts(size: proxy.size)
                let layout = layouts[layoutIndex]
                
                layout {
                    ForEach(items) { item in
                        Text(item.value)
                            .padding(12)
                            .foregroundColor(.white)
                            .frame(height: CGFloat(item.value.count) * 8)
                            .background(Color.blue)
                            .cornerRadius(12)
                            .clipped()
                    }
                }
                .background(Color.gray.opacity(0.5))
                .border(Color.red)
                .animation(.spring(), value: layoutIndex)
                .animation(.spring(), value: items)
                .onAppear {
                    layoutName = layout.fuLayoutName
                }
                .onTapGesture {
                    layoutIndex = (layoutIndex + 1) % layouts.count
                    layoutName = layout.fuLayoutName
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .environment(\.layoutDirection, layoutDirection)
            }
            .frame(maxHeight: 400)
            .clipped()
            
            Spacer()
            
            Button {
                layoutDirection = layoutDirection == .leftToRight ? .rightToLeft : .leftToRight
            } label: {
                Label("Layout Direction", systemImage: layoutDirectionImageName)
            }
            
            Button("Add Item") { items.append(Item(value: items.randomElement()?.value ?? "New Item")) }
            Button("Remove Item") { if !items.isEmpty { items.removeLast() } }
        }
    }
}

struct AnyFULayoutForEachExample: View {
    @State private var items = ["These", "Items", "can be arranged", "into any", "layout", "you like", "with", "FrameUp"]
        .map { Item(id: UUID(), value: $0) }
    @State private var layoutIndex = 0
    @State private var layoutName: String = "FULayout"
    
    @State private var layoutDirection: LayoutDirection = .leftToRight
    var layoutDirectionImageName: String {
        switch layoutDirection {
        case .rightToLeft: return "arrow.right"
        default: return "arrow.left"
        }
    }
    
    var body: some View {
        VStack {
            Text(layoutName)
                .font(.subheadline)
            
            Spacer()
            
            GeometryReader { proxy in
                let layouts = exampleLayouts(size: proxy.size)
                let layout = layouts[layoutIndex]
                
                SmartScrollView([.horizontal, .vertical], optionalScrolling: true, shrinkToFit: true) {
                    layout.forEach(items) { item in
                        Text(item.value)
                            .padding(12)
                            .foregroundColor(.white)
                            .frame(height: CGFloat(item.value.count) * 8)
                            .background(Color.blue)
                            .cornerRadius(12)
                            .clipped()
                    }
                    .background(Color.gray.opacity(0.5))
                    .border(Color.red)
                }
                .animation(.spring(), value: layoutIndex)
                .animation(.spring(), value: items)
                .onAppear {
                    layoutName = layout.fuLayoutName
                }
                .onTapGesture {
                    layoutIndex = (layoutIndex + 1) % layouts.count
                    layoutName = layout.fuLayoutName
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .environment(\.layoutDirection, layoutDirection)
            }
            .frame(maxHeight: 400)
            .clipped()
            
            Spacer()
            
            Button {
                layoutDirection = layoutDirection == .leftToRight ? .rightToLeft : .leftToRight
            } label: {
                Label("Layout Direction", systemImage: layoutDirectionImageName)
            }
            
            Button("Add Item") { items.append(Item(value: items.randomElement()?.value ?? "New Item")) }
            Button("Remove Item") { if !items.isEmpty { items.removeLast() } }
        }
    }
}



struct AnyFULayoutExample_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AnyFULayoutExample()
        }
    }
}
