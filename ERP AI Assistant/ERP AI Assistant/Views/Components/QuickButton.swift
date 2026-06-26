//
//  QuickButton.swift
//  ERP AI Assistant
//
//  Created by Арсений on 25.06.2026.
//
import SwiftUI

struct QuickButton: View {
    let title: String
    let icon: String
    let theme: AppTheme

    var body: some View {
        Button {} label: {
            Label(title, systemImage: icon)
                .font(.caption)
                .foregroundColor(.primary)
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity)
                .background(theme.soft)
                .cornerRadius(14)
        }
    }
}
