//
//  AppMode.swift
//  ERP AI Assistant
//
//  Created by Алина Акимкина on 25.06.2026.
//
import SwiftUI

enum AppMode: String, CaseIterable, Identifiable {
    case light = "Светлый"
    case dark = "Тёмный"
    case system = "Системный"

    var id: String { rawValue }

    var colorScheme: ColorScheme? {
        switch self {
        case .light: return .light
        case .dark: return .dark
        case .system: return nil
        }
    }
}
