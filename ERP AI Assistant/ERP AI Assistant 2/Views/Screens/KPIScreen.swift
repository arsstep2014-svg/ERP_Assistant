//
//  KPIScreen.swift
//  ERP AI Assistant
//
//  Created by Алина Акимкина on 25.06.2026.
//
import SwiftUI

struct KPIScreen: View {
    let theme: AppTheme

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
                ScreenTitle("KPI (отчёты)")

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        PeriodButton("Неделя", isActive: true, theme: theme)
                        PeriodButton("Месяц", isActive: false, theme: theme)
                        PeriodButton("Квартал", isActive: false, theme: theme)
                        PeriodButton("Год", isActive: false, theme: theme)
                        PeriodButton("5 лет", isActive: false, theme: theme)
                    }
                }

                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 14) {
                    KPICard(title: "Выручка", value: "1.25M ₽", change: "+12.5%", icon: "chart.line.uptrend.xyaxis", theme: theme)
                    KPICard(title: "Заказы", value: "248", change: "+8.3%", icon: "cart", theme: theme)
                    KPICard(title: "Склад", value: "87%", change: "+3.2%", icon: "shippingbox", theme: theme)
                    KPICard(title: "Производительность", value: "92%", change: "+5.1%", icon: "speedometer", theme: theme)
                }

                PremiumCard {
                    VStack(alignment: .leading, spacing: 18) {
                        Text("Продажи по категориям")
                            .font(.headline)

                        HStack(spacing: 24) {
                            ZStack {
                                Circle()
                                    .stroke(Color.gray.opacity(0.18), lineWidth: 24)

                                Circle()
                                    .trim(from: 0, to: 0.4)
                                    .stroke(theme.accent, style: StrokeStyle(lineWidth: 24, lineCap: .round))
                                    .rotationEffect(.degrees(-90))
                            }
                            .frame(width: 120, height: 120)

                            VStack(alignment: .leading, spacing: 10) {
                                LegendItem(color: theme.accent, title: "Оборудование", value: "40%")
                                LegendItem(color: theme.accent.opacity(0.7), title: "Услуги", value: "30%")
                                LegendItem(color: theme.accent.opacity(0.45), title: "Подписки", value: "20%")
                                LegendItem(color: .gray.opacity(0.5), title: "Прочее", value: "10%")
                            }
                        }
                    }
                }
            }
            .padding()
        }
    }
}
