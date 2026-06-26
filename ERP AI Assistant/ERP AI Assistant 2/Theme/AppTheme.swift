//
//  AppTheme.swift
//  ERP AI Assistant
//
//  Created by Алина Акимкина on 25.06.2026.
//

import SwiftUI

enum AppTheme: String, CaseIterable, Identifiable {
    case brown = "Коричневый"
    case beige = "Бежевый"
    case gray = "Серый"
    case blue = "Синий"
    case green = "Зелёный"
    case violet = "Фиолетовый"
    case pink = "Розовый"

    var id: String { rawValue }

    var accent: Color {
        switch self {
        case .brown: return Color(red: 0.48, green: 0.32, blue: 0.22)
        case .beige: return Color(red: 0.82, green: 0.72, blue: 0.60)
        case .gray: return Color(red: 0.42, green: 0.42, blue: 0.42)
        case .blue: return Color(red: 0.28, green: 0.46, blue: 0.75)
        case .green: return Color(red: 0.34, green: 0.55, blue: 0.42)
        case .violet: return Color(red: 0.55, green: 0.42, blue: 0.72)
        case .pink: return Color(red: 0.82, green: 0.58, blue: 0.68)
        }
    }

    var soft: Color {
        accent.opacity(0.12)
    }
}
