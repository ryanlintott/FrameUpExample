//
//  TabMenuViewExample.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2021-09-15.
//

import FrameUp
import SwiftUI

struct TabMenuViewExample: View {
    let items = [
        TabMenuItem(image: Image(systemName: "globe"), name: "Info", tab: 0),
        TabMenuItem(image: Image(systemName: "star"), name: "Favourites", tab: 1),
        TabMenuItem(image: Image(systemName: "bookmark"), name: "Categories", tab: 2),
        TabMenuItem(image: Image(systemName: "books.vertical"), name: "About", tab: 3)
    ]

    var body: some View {
        TabMenuView(selection: .constant(0), items: items, isShowingName: false) { isSelected in
            Group {
                if isSelected {
                    Color.accentColor
                } else {
                    Color(.label)
                }
            }
        }
    }
}

struct TabMenuViewExample_Previews: PreviewProvider {
    static var previews: some View {
        TabMenuViewExample()
            .previewLayout(.sizeThatFits)
        
        ZStack {
            // Default SwiftUI TabView for comparison
            TabView(selection: .constant(0)) {
                Color.blue.opacity(0.5)
                    .tabItem {
                        Image(systemName: "globe")
                        Text("Info")
                    }
                    .tag(0)
                
                Color.white
                    .tabItem {
                        Image(systemName: "star")
                        Text("Favourites")
                    }
                    .tag(1)
                
                Color.white
                    .tabItem {
                        Image(systemName: "bookmark")
                        Text("Categories")
                    }
                    .tag(2)
                
                Color.white
                    .tabItem {
                        Image(systemName: "books.vertical")
                        Text("About")
                    }
                    .tag(3)
            }
            
            VStack(spacing: 0) {
                Color.red.opacity(0.5)
                
                TabMenuViewExample()
            }
        }
    }
}
