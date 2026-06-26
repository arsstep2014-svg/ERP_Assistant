//
//  FilterChip.swift
//  ERP AI Assistant
//
//  Created by Арсений on 25.06.2026.
//
import SwiftUI

struct FilterChip: View {
    let title: String
    let active: Bool
    let theme: AppTheme

    init(_ title: String, active: Bool, theme: AppTheme) {
        self.title = title
        self.active = active
        self.theme = theme
    }

    var body: some View {
        Text(title)
            .font(.caption)
            .foregroundColor(active ? .white : .primary)
            .padding(.horizontal, 18)
            .padding(.vertical, 10)
            .background(active ? theme.accent : Color(.secondarySystemBackground))
            .cornerRadius(12)
            .lineLimit(1)
            .fixedSize(horizontal: true, vertical: false)
    }
}
