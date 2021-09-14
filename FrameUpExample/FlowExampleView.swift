//
//  FlowExampleView.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2021-06-10.
//

import FrameUp
import SwiftUI

//struct FlowExampleView: View {
//    @State var items: [Item] = (1...10).map { "Item \($0) " + (Bool.random() ? "\n" : "")  + String(repeating: "x", count: Int.random(in: 0...10)) }.map { Item(value: $0) }
//
//    var body: some View {
//        FlowLayout(items: items, cell: { item in
//            Text(item.value)
//                .padding()
//                .background(RoundedRectangle(cornerRadius: 5).fill(Color.blue))
//        })
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//    }
//}
//
//struct FlowExampleView_Previews: PreviewProvider {
//    static var previews: some View {
//        FlowExampleView()
//    }
//}
