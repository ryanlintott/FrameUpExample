//
//  AnyFULayoutExample.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2022-07-18.
//

import FrameUp
import SwiftUI

struct AnyFULayoutExample: View {
    var body: some View {
        TabView {
            GeometryReader { proxy in
                AnyFULayoutForEachExample(size: proxy.size)
            }
            .tabItem {Label("ForEach", systemImage: "list.dash") }
            GeometryReader { proxy in
                AnyFULayout_ViewExample(size: proxy.size)
            }
            .tabItem {Label("_View", systemImage: "rectangle.3.group") }
        }
    }
}

struct AnyFULayoutForEachExample: View {
    let size: CGSize
    
    let items = ["These", "Items", "can be arranged", "into any", "layout", "you like", "with", "FrameUp"]
        .map { Item(id: UUID(), value: $0) }
    
    var layouts: [AnyFULayout] {
        [
            AnyFULayout(VStackLayout(maxWidth: size.width)),
            AnyFULayout(HStackLayout(maxHeight: size.height)),
            AnyFULayout(VFlowLayout(maxWidth: size.width)),
            AnyFULayout(HFlowLayout(maxHeight: size.height)),
            AnyFULayout(VMasonryLayout(columns: 3, maxWidth: size.width)),
            AnyFULayout(ZStackLayout(maxWidth: size.width, maxHeight: size.height))
        ]
    }

    @State private var layoutIndex = 0
    
    var layout: AnyFULayout {
        layouts[layoutIndex]
    }

    var body: some View {
//        GeometryReader { proxy in
            layout.forEach(items) { item in
                Text(item.value)
                    .padding(12)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(12)
                    .clipped()
            }
            .background(Color.gray.opacity(0.5))
            .animation(.spring(), value: layoutIndex)
            .border(Color.red)
//        }
        .onTapGesture {
            layoutIndex = (layoutIndex + 1) % layouts.count
        }
        .navigationTitle("\(layout.fuLayoutName)")
    }
}

struct AnyFULayout_ViewExample: View {
    let size: CGSize
    
    let items = ["These", "Items", "can be arranged", "into any", "layout", "you like", "with", "FrameUp"]
        .map { Item(id: UUID(), value: $0) }
    
    var layouts: [AnyFULayout] {
        [
            AnyFULayout(VStackLayout(maxWidth: size.width)),
            AnyFULayout(HStackLayout(maxHeight: size.height)),
            AnyFULayout(VFlowLayout(maxWidth: size.width)),
            AnyFULayout(HFlowLayout(maxHeight: size.height)),
            AnyFULayout(VMasonryLayout(columns: 3, maxWidth: size.width)),
            AnyFULayout(ZStackLayout(maxWidth: size.width, maxHeight: size.height))
        ]
    }

    @State private var layoutIndex = 0
    
    var layout: AnyFULayout {
        layouts[layoutIndex]
    }

    var body: some View {
//        GeometryReader { proxy in
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
//        }
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
