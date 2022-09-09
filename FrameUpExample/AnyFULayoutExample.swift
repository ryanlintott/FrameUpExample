//
//  AnyFULayoutExample.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2022-07-18.
//

import FrameUp
import SwiftUI

struct AnyFULayoutExample: View {
    let items = ["These", "Items", "can be arranged", "into any", "layout", "you like", "with", "FrameUp"]
        .map { Item(id: UUID(), value: $0) }
    
    func layouts(size: CGSize) -> [AnyFULayout] {
        [
            AnyFULayout(VFlowFULayout(alignment: .topLeading, maxWidth: size.width)),
            AnyFULayout(VFlowFULayout(alignment: .top, maxWidth: size.width)),
            AnyFULayout(VFlowFULayout(alignment: .topTrailing, maxWidth: size.width)),
            AnyFULayout(VFlowFULayout(alignment: .leading, maxWidth: size.width)),
            AnyFULayout(VFlowFULayout(alignment: .center, maxWidth: size.width)),
            AnyFULayout(VFlowFULayout(alignment: .trailing, maxWidth: size.width)),
            AnyFULayout(VFlowFULayout(alignment: .bottomLeading, maxWidth: size.width)),
            AnyFULayout(VFlowFULayout(alignment: .bottom, maxWidth: size.width)),
            AnyFULayout(VFlowFULayout(alignment: .bottomTrailing, maxWidth: size.width)),
            
            AnyFULayout(VStackFULayout(alignment: .leading, maxWidth: size.width)),
            AnyFULayout(VStackFULayout(alignment: .center, maxWidth: size.width)),
            AnyFULayout(VStackFULayout(alignment: .trailing, maxWidth: size.width)),
            
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
            AnyFULayout(ZStackFULayout(alignment: .bottomTrailing, maxWidth: size.width, maxHeight: size.height)),
            
            AnyFULayout(HFlowFULayout(maxHeight: size.height)),
            AnyFULayout(VMasonryFULayout(columns: 3, maxWidth: size.width))
        ]
    }
    
    var body: some View {
        VStack {
            TabView {
                GeometryReader { proxy in
                    AnyFULayoutForEachExample(size: proxy.size, items: items, layouts: layouts(size: proxy.size))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .tabItem {Label("ForEach", systemImage: "list.dash") }
                
                GeometryReader { proxy in
                    AnyFULayout_ViewExample(size: proxy.size, items: items, layouts: layouts(size: proxy.size))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .tabItem {Label("_View", systemImage: "rectangle.3.group") }
            }
        }
        .environment(\.layoutDirection, .rightToLeft)
    }
}

struct AnyFULayoutForEachExample: View {
    let size: CGSize
    let items: [Item<String>]
    let layouts: [AnyFULayout]

    @State private var layoutIndex = 0
    
    var layout: AnyFULayout {
        layouts[layoutIndex]
    }

    var body: some View {
        layout.forEach(items) { item in
            ZStack {
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
        .animation(.spring(), value: layoutIndex)
        .border(Color.red)
        .onTapGesture {
            layoutIndex = (layoutIndex + 1) % layouts.count
        }
        .navigationTitle("\(layout.fuLayoutName)")
    }
}

struct AnyFULayout_ViewExample: View {
    let size: CGSize
    let items: [Item<String>]
    let layouts: [AnyFULayout]

    @State private var layoutIndex = 0
    
    var layout: AnyFULayout {
        layouts[layoutIndex]
    }

    var body: some View {
        layout._view {
            ForEach(items) { item in
                Text(item.value)
                    .padding(12)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(12)
                    .clipped()
            }
        }
        .background(Color.gray.opacity(0.5))
        .animation(.spring(), value: layoutIndex)
        .border(Color.red)
        .onTapGesture {
            layoutIndex = (layoutIndex + 1) % layouts.count
        }
        .navigationTitle("\(layout.fuLayoutName)")
    }
}

struct AnyFULayoutExample_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AnyFULayoutExample()
        }
    }
}
