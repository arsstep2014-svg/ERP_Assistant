//
//  TaskRow.swift
//  ERP AI Assistant
//
//  Created by Арсений on 25.06.2026.
//
import SwiftUI

struct TaskRow: View {
    let task: ERPTask
    let theme: AppTheme

    var body: some View {
        PremiumCard {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Text(task.title)
                        .font(.headline)

                    Spacer()

                    Text(task.status)
                        .font(.caption)
                        .foregroundColor(theme.accent)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .background(theme.soft)
                        .cornerRadius(10)

                    Image(systemName: "ellipsis")
                        .foregroundColor(.secondary)
                }

                HStack(spacing: 18) {
                    Label(task.employee, systemImage: "person")
                    Label(task.deadline, systemImage: "calendar")
                }
                .font(.caption)
                .foregroundColor(.secondary)
            }
        }
    }
}
