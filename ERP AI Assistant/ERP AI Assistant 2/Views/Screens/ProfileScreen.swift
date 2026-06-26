//
//  ProfileScreen.swift
//  ERP AI Assistant
//
//  Created by Алина Акимкина on 25.06.2026.
//
import SwiftUI

struct ProfileScreen: View {
    let theme: AppTheme
    @Binding var selectedTheme: String
    @Binding var selectedMode: String

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 18) {
                ScreenTitle("Профиль")

                PremiumCard {
                    HStack(spacing: 16) {
                        Circle()
                            .fill(theme.accent)
                            .frame(width: 64, height: 64)
                            .overlay {
                                Text("AA")
                                    .font(.headline)
                                    .foregroundColor(.white)
                            }

                        VStack(alignment: .leading, spacing: 5) {
                            Text("Арсений Степанов")
                                .font(.headline)

                            Text("ERP Manager")
                                .font(.subheadline)
                                .foregroundColor(.secondary)

                            Text("arseniy@example.com")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }

                        Spacer()

                        Image(systemName: "chevron.right")
                            .foregroundColor(.secondary)
                    }
                }

                PremiumCard {
                    VStack(spacing: 0) {
                        ProfileRow(title: "Настройки профиля", icon: "gearshape", theme: theme)
                        Divider()
                        ProfileRow(title: "Уведомления", icon: "bell", theme: theme)
                        Divider()
                        ProfileRow(title: "Безопасность", icon: "lock.shield", theme: theme)
                        Divider()
                        ProfileRow(title: "О приложении", icon: "info.circle", theme: theme)
                    }
                }

                PremiumCard {
                    VStack(alignment: .leading, spacing: 18) {
                        Text("Внешний вид")
                            .font(.headline)

                        Text("Цветовая тема приложения")
                            .font(.subheadline)
                            .foregroundColor(.secondary)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 18) {
                                ForEach(AppTheme.allCases) { item in
                                    Button {
                                        selectedTheme = item.rawValue
                                    } label: {
                                        VStack(spacing: 8) {
                                            RoundedRectangle(cornerRadius: 12)
                                                .fill(item.accent)
                                                .frame(width: 46, height: 34)
                                                .overlay {
                                                    if selectedTheme == item.rawValue {
                                                        Image(systemName: "checkmark")
                                                            .font(.caption)
                                                            .foregroundColor(.white)
                                                    }
                                                }
                                            
                                            Text(item.rawValue)
                                                .font(.system(size: 10))
                                                .lineLimit(1)
                                                .fixedSize(horizontal: true, vertical: false)
                                                .foregroundColor(.secondary)
                                        }
                                    }
                                }
                            }
                        }

                        Divider()

                        Text("Режим")
                            .font(.subheadline)
                            .foregroundColor(.secondary)

                        HStack {
                            ModeButton(
                                title: "Светлый",
                                icon: "sun.max",
                                active: selectedMode == AppMode.light.rawValue,
                                theme: theme
                            ) {
                                selectedMode = AppMode.light.rawValue
                            }

                            ModeButton(
                                title: "Тёмный",
                                icon: "moon",
                                active: selectedMode == AppMode.dark.rawValue,
                                theme: theme
                            ) {
                                selectedMode = AppMode.dark.rawValue
                            }

                            ModeButton(
                                title: "Системный",
                                icon: "iphone",
                                active: selectedMode == AppMode.system.rawValue,
                                theme: theme
                            ) {
                                selectedMode = AppMode.system.rawValue
                            }
                        }
                    }
                }

                Button {} label: {
                    Label("Выйти", systemImage: "rectangle.portrait.and.arrow.right")
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(16)
                }
            }
            .padding()
        }
    }
}
