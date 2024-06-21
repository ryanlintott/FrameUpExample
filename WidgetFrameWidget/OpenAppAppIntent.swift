//
//  OpenAppAppIntent.swift
//  FrameUpExample
//
//  Created by Ryan Lintott on 2024-06-20.
//

import Foundation
import AppIntents

@available(iOS 16.0, *)
struct OpenApp: AppIntent {
    static let title: LocalizedStringResource = "Open app"
    
    @MainActor
    func perform() async throws -> some IntentResult {
        return .result()
    }
    
    static let openAppWhenRun: Bool = true
}
