//
//  ERP_AI_AssistantApp.swift
//  ERP AI Assistant
//
//  Created by Алина Акимкина on 25.05.2026.
//

import SwiftUI
import SwiftData

@main
struct ERP_AI_AssistantApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: TaskItem.self)
    }
}
