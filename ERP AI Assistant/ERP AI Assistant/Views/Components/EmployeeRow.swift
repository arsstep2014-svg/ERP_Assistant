//
//  EmployeeRow.swift
//  ERP AI Assistant
//
//  Created by Арсений on 25.06.2026.
//
import SwiftUI

struct EmployeeRow: View {
    let employee: Employee
    let theme: AppTheme

    var body: some View {
        HStack(spacing: 14) {
            Circle()
                .fill(theme.soft)
                .frame(width: 48, height: 48)
                .overlay {
                    Text(employee.initials)
                        .font(.caption)
                        .bold()
                        .foregroundColor(theme.accent)
                }

            VStack(alignment: .leading, spacing: 4) {
                Text(employee.name)
                    .font(.headline)

                Text(employee.position)
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Text(employee.department)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Spacer()

            Image(systemName: "envelope")
                .foregroundColor(theme.accent)

            Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 10)
    }
}
