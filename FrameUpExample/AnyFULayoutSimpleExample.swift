//
//  AnyFULayoutSimpleExample.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2022-09-14.
//

import FrameUp
import SwiftUI

struct AnyFULayoutSimpleExample: View {
    let maxSize: CGSize
    
    @State private var isVStack: Bool = true
    
    var vStackLayout: AnyFULayout {
        AnyFULayout(VStackFULayout(alignment: .center, maxWidth: maxSize.width))
    }
    
    var hStackLayout: AnyFULayout {
        AnyFULayout(HStackFULayout(alignment: .center, maxHeight: maxSize.height))
    }
    
    var layout: AnyFULayout {
        isVStack ? vStackLayout : hStackLayout
    }
    
    
    var body: some View {
        layout {
            Text("First")
            Text("Second")
            Text("Third")
        }
        .foregroundColor(.white)
        .padding()
        .background(Color.blue)
        .animation(.spring(), value: isVStack)
        .onTapGesture {
            isVStack.toggle()
        }
    }
}

struct AnyFULayoutSimpleExample_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { proxy in
            AnyFULayoutSimpleExample(maxSize: proxy.size)
        }
    }
}
