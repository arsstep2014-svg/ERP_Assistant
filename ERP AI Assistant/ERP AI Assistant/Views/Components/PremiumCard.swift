//
//  PremiumCard.swift
//  ERP AI Assistant
//
//  Created by Алина Акимкина on 25.06.2026.
//
import SwiftUI

struct PremiumCard<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        content
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(24)
            .shadow(color: .black.opacity(0.055), radius: 16, x: 0, y: 8)
    }
}
