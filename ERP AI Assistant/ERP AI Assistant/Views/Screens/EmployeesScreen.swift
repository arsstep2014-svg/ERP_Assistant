//
//  EmployeesScreen.swift
//  ERP AI Assistant
//
//  Created by Алина Акимкина on 25.06.2026.
//
import SwiftUI

struct EmployeesScreen: View {
    let theme: AppTheme
    @State private var searchText = ""
//    @State private var employees = EmployeeLoader.load()
    @StateObject private var viewModel = EmployeesViewModel()
    
    private var filteredEmployees: [Employee] {
        if searchText.isEmpty {
            return viewModel.employees
        }

        return viewModel.employees.filter {
            $0.name.localizedCaseInsensitiveContains(searchText)
            ||
            $0.position.localizedCaseInsensitiveContains(searchText)
            ||
            $0.department.localizedCaseInsensitiveContains(searchText)
        }
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 18) {
                ScreenTitle("Сотрудники")

                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.secondary)

                        TextField("Поиск сотрудников...", text: $searchText)
                    }
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(16)

                    Button {} label: {
                        Image(systemName: "slider.horizontal.3")
                            .foregroundColor(theme.accent)
                            .frame(width: 48, height: 48)
                            .background(theme.soft)
                            .cornerRadius(16)
                    }
                }

                PremiumCard {

                    if viewModel.isLoading {

                        VStack(spacing: 12) {
                            ProgressView()
                            Text("Загрузка сотрудников...")
                                .foregroundColor(.secondary)
                        }
                        .frame(maxWidth: .infinity, minHeight: 180)
                        .padding()

                    } else if let errorMessage = viewModel.errorMessage {

                        VStack(spacing: 12) {
                            Image(systemName: "exclamationmark.triangle")
                                .font(.largeTitle)
                                .foregroundColor(.orange)

                            Text(errorMessage)
                                .font(.headline)

                            Button("Повторить") {
                                Task {
                                    await viewModel.loadEmployees()
                                }
                            }
                            .foregroundColor(theme.accent)
                        }
                        .frame(maxWidth: .infinity, minHeight: 180)
                        .padding()

                    } else if filteredEmployees.isEmpty {

                        VStack(spacing: 12) {
                            Image(systemName: "person.slash")
                                .font(.largeTitle)
                                .foregroundColor(.gray)

                            Text("Сотрудники не найдены")
                                .font(.headline)

                            Text("Попробуйте изменить поисковый запрос")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        .frame(maxWidth: .infinity, minHeight: 180)
                        .padding()

                    } else {

                        VStack(spacing: 0) {
                            ForEach(filteredEmployees) { employee in
                                EmployeeRow(employee: employee, theme: theme)

                                if employee.id != filteredEmployees.last?.id {
                                    Divider()
                                        .padding(.leading, 64)
                                }
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .onAppear {
            Task {
                await viewModel.loadEmployees()
            }
        }
    }
}
