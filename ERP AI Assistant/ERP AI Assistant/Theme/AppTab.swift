//
//  AppTab.swift
//  ERP AI Assistant
//
//  Created by Алина Акимкина on 25.06.2026.
//

import Foundation

enum AppTab: String, CaseIterable {
    case kpi = "KPI"
    case tasks = "Задачи"
    case ai = "AI"
    case employees = "Сотрудники"
    case profile = "Профиль"

    var icon: String {
        switch self {
        case .kpi: return "chart.pie"
        case .tasks: return "checklist"
        case .ai: return "sparkles"
        case .employees: return "person.2"
        case .profile: return "person"
        }
    }
}
