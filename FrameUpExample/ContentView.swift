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
    
    @ViewBuilder
    var examples: some View {
        AutoRotatingViewExamples()
        
        FrameAdjustmentExamples()
        
        FULayoutExamples()
        
        LayoutExamples()
        
        SmartScrollViewExamples()
        
        TabMenuExamples()
        
        TagViewExamples()
        
        WidgetExamples()
        
        TwoSidedViewExamples()
        
        /// These likely won't work
        ExperimentViews()
    }
    
    var body: some View {
        #if os(iOS)
        NavigationView {
            VStack {
                logo
                
                List {
                    examples
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
                
                examples
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
