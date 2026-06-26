//
//  ProfileRow.swift
//  ERP AI Assistant
//
//  Created by Арсений on 25.06.2026.
//
import SwiftUI

struct ProfileRow: View {
    let title: String
    let icon: String
    let theme: AppTheme

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(theme.accent)
                .frame(width: 26)

            Text(title)
                .font(.subheadline)

            Spacer()

            Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 14)
    }
}
