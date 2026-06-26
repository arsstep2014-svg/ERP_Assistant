//
//  ContentView.swift
//  ERP AI Assistant
//
//  Created by Алина Акимкина on 25.05.2026.
//
import SwiftUI
import SwiftData
import WebKit




extension Date {
    var taskFormat: String {
        self.formatted(
            .dateTime
                .day()
                .month(.wide)
                .year()
                .locale(Locale(identifier: "ru_RU"))
        )
    }
}


// MARK: - Data

let taskData = [
    ERPTask(title: "Подготовить отчёт по продажам", employee: "Иванов Иван", deadline: "30 мая 2026", status: "В работе"),
    ERPTask(title: "Проверить финансовые документы", employee: "Петрова Анна", deadline: "01 июня 2026", status: "Новая"),
    ERPTask(title: "Оформить заявку на оборудование", employee: "Сидоров Алексей", deadline: "05 июня 2026", status: "Ожидает"),
    ERPTask(title: "Обновить базу клиентов", employee: "Иванов Иван", deadline: "07 июня 2026", status: "В работе"),
    ERPTask(title: "Провести собеседование", employee: "Кузнецова Мария", deadline: "10 июня 2026", status: "Новая")
]

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

// MARK: - Custom Tab Bar

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


// MARK: - Employees Screen



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

struct QuickButton: View {
    let title: String
    let icon: String
    let theme: AppTheme

    var body: some View {
        Button {} label: {
            Label(title, systemImage: icon)
                .font(.caption)
                .foregroundColor(.primary)
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity)
                .background(theme.soft)
                .cornerRadius(14)
        }
    }
}

struct PeriodButton: View {
    let title: String
    let isActive: Bool
    let theme: AppTheme

    init(_ title: String, isActive: Bool, theme: AppTheme) {
        self.title = title
        self.isActive = isActive
        self.theme = theme
    }

    var body: some View {
        Text(title)
            .font(.caption)
            .foregroundColor(isActive ? .white : .primary)
            .frame(width: 92)
            .padding(.vertical, 10)
            .background(isActive ? theme.accent : Color(.secondarySystemBackground))
            .cornerRadius(10)
    }
}

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

struct LegendItem: View {
    let color: Color
    let title: String
    let value: String

    var body: some View {
        HStack {
            Circle()
                .fill(color)
                .frame(width: 8, height: 8)

            Text(title)
                .font(.caption)

            Spacer()

            Text(value)
                .font(.caption)
                .bold()
        }
    }
}

struct FilterChip: View {
    let title: String
    let active: Bool
    let theme: AppTheme

    init(_ title: String, active: Bool, theme: AppTheme) {
        self.title = title
        self.active = active
        self.theme = theme
    }

    var body: some View {
        Text(title)
            .font(.caption)
            .foregroundColor(active ? .white : .primary)
            .padding(.horizontal, 18)
            .padding(.vertical, 10)
            .background(active ? theme.accent : Color(.secondarySystemBackground))
            .cornerRadius(12)
            .lineLimit(1)
            .fixedSize(horizontal: true, vertical: false)
    }
}

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

struct ProfileRow: View {
    let title: String
    let icon: String
    let theme: AppTheme

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(theme.accent)
                .frame(width: 26)

            Text(title)
                .font(.subheadline)

            Spacer()

            Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 14)
    }
}

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
