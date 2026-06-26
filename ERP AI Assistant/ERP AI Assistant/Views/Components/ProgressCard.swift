//
//  ProgressCard.swift
//  ERP AI Assistant
//
//  Created by Арсений on 25.06.2026.
//
import SwiftUI


struct ProgressCard: View {
    let theme: AppTheme

    let rows: [(String, CGFloat)] = [
        ("Общий обзор", 1.0),
        ("Разработка модулей", 0.73),
        ("Финансовый отдел", 0.60),
        ("Отдел продаж", 0.48),
        ("Склад и логистика", 0.37),
        ("HR отдел", 0.25),
        ("ИТ-поддержка", 0.18),
        ("Юридический отдел", 0.12)
    ]

    var body: some View {
        PremiumCard {
            VStack(alignment: .leading, spacing: 18) {
                HStack {
                    Text("ПРОГРЕСС ЗАДАЧ ПО ОТДЕЛАМ")
                        .font(.caption)
                        .fontWeight(.semibold)

                    Spacer()

                    Text("Эта неделя")
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                    Image(systemName: "chevron.down")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }

                HStack {
                    Spacer()
                    Text("0%")
                    Spacer()
                    Text("25%")
                    Spacer()
                    Text("50%")
                    Spacer()
                    Text("75%")
                    Spacer()
                    Text("100%")
                }
                .font(.caption)
                .foregroundColor(.secondary)

                ForEach(rows, id: \.0) { row in
                    HStack {
                        Text(row.0)
                            .font(.caption)
                            .frame(width: 120, alignment: .leading)

                        GeometryReader { geo in
                            ZStack(alignment: .leading) {
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(Color.gray.opacity(0.12))
                                    .frame(height: 10)

                                RoundedRectangle(cornerRadius: 4)
                                    .fill(theme.accent)
                                    .frame(width: geo.size.width * row.1, height: 10)
                            }
                        }
                        .frame(height: 10)
                    }
                }
            }
        }
    }
}

