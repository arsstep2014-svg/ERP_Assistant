//
//  PeriodButton.swift
//  ERP AI Assistant
//
//  Created by Арсений on 25.06.2026.
//
import SwiftUI

struct PeriodButton: View {
    let title: String
    let isActive: Bool
    let theme: AppTheme

    init(_ title: String, isActive: Bool, theme: AppTheme) {
        self.title = title
        self.isActive = isActive
        self.theme = theme
    }

    var body: some View {
        Text(title)
            .font(.caption)
            .foregroundColor(isActive ? .white : .primary)
            .frame(width: 92)
            .padding(.vertical, 10)
            .background(isActive ? theme.accent : Color(.secondarySystemBackground))
            .cornerRadius(10)
    }
}
