//
//  KPICard.swift
//  ERP AI Assistant
//
//  Created by Арсений on 25.06.2026.
//

import SwiftUI

struct KPICard: View {
    let title: String
    let value: String
    let change: String
    let icon: String
    let theme: AppTheme

    var body: some View {
        PremiumCard {
            VStack(alignment: .leading, spacing: 10) {
                Image(systemName: icon)
                    .foregroundColor(theme.accent)

                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Text(value)
                    .font(.title2)
                    .bold()

                Text(change)
                    .font(.caption)
                    .foregroundColor(.green)

                HStack(alignment: .bottom, spacing: 4) {
                    ForEach([10, 16, 13, 22, 18, 25], id: \.self) { value in
                        RoundedRectangle(cornerRadius: 3)
                            .fill(theme.accent.opacity(0.55))
                            .frame(width: 8, height: CGFloat(value))
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
