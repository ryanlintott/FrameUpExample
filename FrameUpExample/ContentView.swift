//
//  ContentView.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2021-09-14.
//

import SwiftUI

struct ContentView: View {
    var logo: some View {
        Image("FrameUp-logo")
            .resizable()
            .scaledToFit()
            .frame(maxWidth: 400)
            .padding()
    }
    
    var body: some View {
        #if os(iOS)
        NavigationView {
            VStack {
                logo
                
                Form {
                    Examples()
                }
            }
            .navigationTitle("FrameUp")
            .navigationBarHidden(true)
        }
        .navigationViewStyle(.stack)
        #else
        NavigationView {
            List {
                logo
                
                Examples()
            }
            .navigationTitle("FrameUp")
        }
        #endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
