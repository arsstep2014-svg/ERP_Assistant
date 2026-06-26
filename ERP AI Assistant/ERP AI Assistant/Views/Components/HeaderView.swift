//
//  HeaderView.swift
//  ERP AI Assistant
//
//  Created by Алина Акимкина on 25.06.2026.
//
import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let theme: AppTheme

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(.system(size: 28, weight: .semibold))

                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

            Spacer()

            Image(systemName: "bell")
                .font(.title3)
                .foregroundColor(theme.accent)
                .overlay(alignment: .topTrailing) {
                    Circle()
                        .fill(theme.accent)
                        .frame(width: 8, height: 8)
                }
        }
        .padding(.top, 10)
    }
}
