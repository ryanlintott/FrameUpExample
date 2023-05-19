//
//  TabMenuExampleView.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2021-09-16.
//

import FrameUp
import SwiftUI

#if os(iOS)
struct TabMenuExampleView: View {
    @State private var selection = 0
    @State private var reselect: Bool = false
    @State private var doubleTap: Bool = false

    var body: some View {
        VStack {
            Group {
                switch selection {
                case 0:
                    Color.blue
                        .overlay(Text("Info"))
                case 1:
                    Color.red
                        .overlay(Text("Favourites"))
                case 2:
                    Color.green
                        .overlay(Text("Categories"))
                case 3:
                    Color.purple
                        .overlay(Text("About"))
                default:
                    Color.white
                }
            }
            .font(.system(size: 30))
            .overlay(
                VStack {
                    Spacer()
                    
                    if reselect {
                        Text("Reselect")
                    }
                    if doubleTap {
                        Text("DoubleTap")
                    }
                }
            )
            .foregroundColor(.white)
            
            TabMenuExample(selection: $selection, onReselect: onReselect, onDoubleTap: onDoubleTap)
        }
        .navigationTitle("TabMenu")
    }
    
    func onReselect() {
        withAnimation {
            reselect = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            reselect = false
        }
    }
    
    func onDoubleTap() {
        withAnimation {
            doubleTap = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            doubleTap = false
        }
    }
}

struct TabMenuViewExampleView_Previews: PreviewProvider {
    static var previews: some View {
        TabMenuExampleView()
    }
}
#endif
