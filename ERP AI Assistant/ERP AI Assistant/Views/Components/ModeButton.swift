//
//  ModeButton..swift
//  ERP AI Assistant
//
//  Created by Арсений on 25.06.2026.
//

import SwiftUI

struct ModeButton: View {
    let title: String
    let icon: String
    let active: Bool
    let theme: AppTheme
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                Image(systemName: icon)
            }
            .font(.caption)
            .foregroundColor(active ? theme.accent : .secondary)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(active ? theme.soft : Color.gray.opacity(0.08))
            .cornerRadius(14)
        }
    }
}
