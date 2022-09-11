//
//  AnyFULayoutExample.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2022-07-18.
//

import FrameUp
import SwiftUI

struct AnyFULayoutExample: View {
    @State private var items = ["These", "Items", "can be arranged", "into any", "layout", "you like", "with", "FrameUp"]
        .map { Item(id: UUID(), value: $0) }
    
    func layouts(size: CGSize) -> [AnyFULayout] {
        [
            AnyFULayout(VMasonry(alignment: .topLeading, columns: 3, maxWidth: size.width)),
            AnyFULayout(VMasonry(alignment: .top, columns: 3, maxWidth: size.width)),
            AnyFULayout(VMasonry(alignment: .topTrailing, columns: 3, maxWidth: size.width)),
            AnyFULayout(VMasonry(alignment: .leading, columns: 3, maxWidth: size.width)),
            AnyFULayout(VMasonry(alignment: .center, columns: 3, maxWidth: size.width)),
            AnyFULayout(VMasonry(alignment: .trailing, columns: 3, maxWidth: size.width)),
            AnyFULayout(VMasonry(alignment: .bottomLeading, columns: 3, maxWidth: size.width)),
            AnyFULayout(VMasonry(alignment: .bottom, columns: 3, maxWidth: size.width)),
            AnyFULayout(VMasonry(alignment: .bottomTrailing, columns: 3, maxWidth: size.width)),
            
            AnyFULayout(VFlow(alignment: .topLeading, maxHeight: size.height)),
            AnyFULayout(VFlow(alignment: .top, maxHeight: size.height)),
            AnyFULayout(VFlow(alignment: .topTrailing, maxHeight: size.height)),
            AnyFULayout(VFlow(alignment: .leading, maxHeight: size.height)),
            AnyFULayout(VFlow(alignment: .center, maxHeight: size.height)),
            AnyFULayout(VFlow(alignment: .trailing, maxHeight: size.height)),
            AnyFULayout(VFlow(alignment: .bottomLeading, maxHeight: size.height)),
            AnyFULayout(VFlow(alignment: .bottom, maxHeight: size.height)),
            AnyFULayout(VFlow(alignment: .bottomTrailing, maxHeight: size.height)),
            
            AnyFULayout(HFlow(alignment: .topLeading, maxWidth: size.width)),
            AnyFULayout(HFlow(alignment: .top, maxWidth: size.width)),
            AnyFULayout(HFlow(alignment: .topTrailing, maxWidth: size.width)),
            AnyFULayout(HFlow(alignment: .leading, maxWidth: size.width)),
            AnyFULayout(HFlow(alignment: .center, maxWidth: size.width)),
            AnyFULayout(HFlow(alignment: .trailing, maxWidth: size.width)),
            AnyFULayout(HFlow(alignment: .bottomLeading, maxWidth: size.width)),
            AnyFULayout(HFlow(alignment: .bottom, maxWidth: size.width)),
            AnyFULayout(HFlow(alignment: .bottomTrailing, maxWidth: size.width)),
            
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
            AnyFULayout(ZStackFULayout(alignment: .bottomTrailing, maxWidth: size.width, maxHeight: size.height))
        ]
    }
    
    @State private var layoutDirection: LayoutDirection = .leftToRight
    var layoutDirectionImageName: String {
        switch layoutDirection {
        case .rightToLeft: return "arrow.right"
        default: return "arrow.left"
        }
    }
    
    var body: some View {
        VStack {
            TabView {
                GeometryReader { proxy in
                    AnyFULayoutForEachExample(size: proxy.size, items: items, layouts: layouts(size: proxy.size))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                //.frame(maxHeight: 400)
                .tabItem { Label("ForEach", systemImage: "list.dash") }
                
                GeometryReader { proxy in
                    AnyFULayout_ViewExample(size: proxy.size, items: items, layouts: layouts(size: proxy.size))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .tabItem { Label("_View", systemImage: "rectangle.3.group") }
            }
            
            Button {
                layoutDirection = layoutDirection == .leftToRight ? .rightToLeft : .leftToRight
            } label: {
                Label("Layout Direction", systemImage: layoutDirectionImageName)
            }
            
            Button("Add") { items.append(Item(value: "asdf")) }
            Button("Remove") { if !items.isEmpty { items.removeLast() } }
        }
        .environment(\.layoutDirection, layoutDirection)
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
        .border(Color.red)
        .animation(.spring(), value: layoutIndex)
        .animation(.spring(), value: items)
        .onTapGesture {
            layoutIndex = (layoutIndex + 1) % layouts.count
        }
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
        .onTapGesture {
            layoutIndex = (layoutIndex + 1) % layouts.count
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
