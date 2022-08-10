//
//  VFlowLayoutExample.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2022-07-18.
//

import FrameUp
import SwiftUI

struct VFlowLayoutExample: View {
    var body: some View {
        TabView {
            VFlowLayoutForEachExample()
                .tabItem {Label("ForEach", systemImage: "list.dash") }
            
            VFlowLayoutForEachExample()
                .tabItem {Label("_View", systemImage: "rectangle.3.group") }
        }
    }
}

struct VFlowLayoutForEachExample: View {
    let items = ["FULayout", "Layup", "Formation", "Board", "Gang", "Herd", "Hord", "Swarm", "Arrangement", "Exhibit", "Blueprint", "Collage"]
        .map { Item(id: UUID(), value: $0) }
    
    @State private var maxWidth: CGFloat = 500
    
    var body: some View {
        VStack {
            WidthReader { width in
                VFlowLayout(maxWidth: width).forEach(items) { item in
                    Text(item.value)
                        .padding()
                        .foregroundColor(.white)
                        .background(Capsule().fill(.blue))
                }
                .background(Color.gray)
                .animation(.spring(), value: maxWidth)
                
            }
            .frame(maxWidth: maxWidth)
            
            Spacer()
            HStack {
                Text("Max Width")
                Slider(value: $maxWidth, in: 50...600) {
                    Text("Max Width")
                }
            }
            .padding()
        }
    }
}

struct VFlowLayout_ViewExample: View {
    let items = ["FULayout", "Layup", "Formation", "Board", "Gang", "Herd", "Hord", "Swarm", "Arrangement", "Exhibit", "Blueprint", "Collage"]
        .map { Item(id: UUID(), value: $0) }
    
    @State private var maxWidth: CGFloat = 300
    
    var body: some View {
        VStack {
            SmartScrollView([.vertical], optionalScrolling: true, shrinkToFit: true) {
                WidthReader { width in
                    VFlowLayout(
                        maxWidth: width)._view {
                            ForEach(items) { item in
                                Text(item.value)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Capsule().fill(.blue))
                            }
                        }
                        .background(Color.gray)
                        .animation(.spring(),
                                   value: maxWidth)
                }
                .frame(maxWidth: maxWidth)                
            }
            Spacer()
            HStack {
                Text("Max Width")
                Slider(value: $maxWidth, in: 50...600) {
                    Text("Max Width")
                }
            }
            .padding()
        }
    }
}

struct VFlowLayoutExample_Previews: PreviewProvider {
    static var previews: some View {
        VFlowLayoutExample()
    }
}
