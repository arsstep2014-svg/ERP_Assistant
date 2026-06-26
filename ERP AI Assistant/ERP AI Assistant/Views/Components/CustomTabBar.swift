//
//  CustomTabBar.swift
//  ERP AI Assistant
//
//  Created by Алина Акимкина on 25.06.2026.
//
import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: AppTab
    let theme: AppTheme

    var body: some View {
        HStack {
            ForEach(AppTab.allCases, id: \.self) { tab in
                Button {
                    withAnimation(.spring(response: 0.35, dampingFraction: 0.75)) {
                        selectedTab = tab
                    }
                } label: {
                    VStack(spacing: 5) {
                        Image(systemName: tab.icon)
                            .font(.system(size: tab == .ai ? 25 : 22, weight: .medium))

                        Text(tab.rawValue)
                            .font(.system(size: 11, weight: .medium))
                    }
                    .foregroundColor(selectedTab == tab ? theme.accent : .gray)
                    .frame(maxWidth: .infinity)
                    .offset(y: tab == .ai ? -14 : 0)
                    .scaleEffect(selectedTab == tab && tab == .ai ? 1.12 : 1.0)
                }
            }
        }
        .padding(.horizontal, 18)
        .padding(.top, 18)
        .padding(.bottom, 22)
        .background(
            RoundedRectangle(cornerRadius: 34)
                .fill(Color(.secondarySystemBackground))
                .shadow(color: .black.opacity(0.08), radius: 18, x: 0, y: 8)
        )
        .padding(.horizontal, 16)
        .padding(.bottom, 8)
        .overlay {
            Circle()
                .fill(theme.accent)
                .frame(width: 70, height: 70)
                .overlay {
                    Image(systemName: "sparkles")
                        .font(.system(size: 28, weight: .semibold))
                        .foregroundColor(.white)
                }
                .shadow(color: theme.accent.opacity(0.35), radius: 16, x: 0, y: 8)
                .offset(y: -28)
                .allowsHitTesting(false)
        }
    }
}
