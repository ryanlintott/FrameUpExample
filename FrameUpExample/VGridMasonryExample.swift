//
//  VGridMasonryExample.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2022-04-21.
//

import FrameUp
import SwiftUI

struct VGridMasonryExample: View {
    let items = [1, 1.3, 1.4, 0.5, 0.7, 1.1, 2, 0.6]
        .map { Item(id: UUID(), value: $0) }
    
    var body: some View {
        ScrollView {
            WidthReader { width in
                VGridMasonry(items, width: width, columns: 2, horizontalSpacing: 5, verticalSpacing: 5) { item in
                    Color.blue
                        .aspectRatio(item.value, contentMode: .fit)
                        .overlay(
                            Text(String(item.value))
                                .foregroundColor(.white)
                        )
                        .cornerRadius(12)
                }
            }
            .padding(5)
        }
        .navigationTitle("VFlow")
    }
}
struct VGridMasonryExample_Previews: PreviewProvider {
    static var previews: some View {
        VGridMasonryExample()
    }
}
