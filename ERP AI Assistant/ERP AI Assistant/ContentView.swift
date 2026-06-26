//
//  ContentView.swift
//  ERP AI Assistant
//
//  Created by Алина Акимкина on 25.05.2026.
//
import SwiftUI
import SwiftData
import WebKit




// MARK: - Data

//let taskData = [
//    ERPTask(title: "Подготовить отчёт по продажам", employee: "Иванов Иван", deadline: "30 мая 2026", status: "В работе"),
//    ERPTask(title: "Проверить финансовые документы", employee: "Петрова Анна", deadline: "01 июня 2026", status: "Новая"),
//    ERPTask(title: "Оформить заявку на оборудование", employee: "Сидоров Алексей", deadline: "05 июня 2026", status: "Ожидает"),
//    ERPTask(title: "Обновить базу клиентов", employee: "Иванов Иван", deadline: "07 июня 2026", status: "В работе"),
//    ERPTask(title: "Провести собеседование", employee: "Кузнецова Мария", deadline: "10 июня 2026", status: "Новая")
//]

//let employeeData = [
//    Employee(name: "Иванов Иван", position: "Менеджер по продажам", department: "Отдел продаж", initials: "ИИ"),
//    Employee(name: "Петрова Анна", position: "Бухгалтер", department: "Финансовый отдел", initials: "ПА"),
//    Employee(name: "Сидоров Алексей", position: "Специалист по закупкам", department: "Отдел закупок", initials: "СА"),
//    Employee(name: "Кузнецова Мария", position: "HR-менеджер", department: "Отдел персонала", initials: "КМ")
//]

// MARK: - Root

struct ContentView: View {
    @State private var selectedTab: AppTab = .ai
    @AppStorage("selectedTheme") private var selectedTheme = AppTheme.brown.rawValue
    @AppStorage("selectedMode") private var selectedMode = AppMode.light.rawValue

    private var theme: AppTheme {
        AppTheme(rawValue: selectedTheme) ?? .brown
    }
    
    private var mode: AppMode {
        AppMode(rawValue: selectedMode) ?? .light
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            Color(.systemGray5)
                .ignoresSafeArea()

            currentScreen
                .padding(.bottom, 92)

            CustomTabBar(selectedTab: $selectedTab, theme: theme)
        }
        .tint(theme.accent)
        .preferredColorScheme(mode.colorScheme)
    }

    @ViewBuilder
    private var currentScreen: some View {
        switch selectedTab {
        case .kpi:
            KPIScreen(theme: theme)
        case .tasks:
            TasksScreen(theme: theme)
        case .ai:
            AIScreen(theme: theme)
        case .employees:
            EmployeesScreen(theme: theme)
        case .profile:
            ProfileScreen(theme: theme, selectedTheme: $selectedTheme, selectedMode: $selectedMode)
        }
    }
}

