//
//  TasksScreen.swift
//  ERP AI Assistant
//
//  Created by Алина Акимкина on 25.06.2026.
//
import SwiftUI
import SwiftData


struct TasksScreen: View {
    let theme: AppTheme

    @State private var searchText = ""
    @State private var showCreateTask = false

    @Query(sort: \TaskItem.createdAt, order: .reverse)
    private var savedTasks: [TaskItem]

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 18) {
                ScreenTitle("Задачи")

                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.secondary)

                        TextField("Поиск задач...", text: $searchText)
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

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        FilterChip("Все", active: true, theme: theme)
                        FilterChip("В работе", active: false, theme: theme)
                        FilterChip("Ожидают", active: false, theme: theme)
                        FilterChip("Завершенные", active: false, theme: theme)
                    }
                }

                if savedTasks.isEmpty {
                    ForEach(taskData) { task in
                        TaskRow(task: task, theme: theme)
                    }
                } else {
                    ForEach(savedTasks) { task in
                        TaskRow(
                            task: ERPTask(
                                title: task.title,
                                employee: task.employee,
                                deadline: task.deadline.taskFormat,
                                status: task.status
                            ),
                            theme: theme
                        )
                    }
                }

                Button {
                    showCreateTask = true
                } label: {
                    Image(systemName: "plus")
                        .font(.title2)
                        .foregroundColor(.white)
                        .frame(width: 58, height: 58)
                        .background(theme.accent)
                        .clipShape(Circle())
                        .shadow(color: theme.accent.opacity(0.28), radius: 12, x: 0, y: 6)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.top, 12)
            }
            .padding()
        }
        .sheet(isPresented: $showCreateTask) {
            CreateTaskScreen(theme: theme)
        }
    }
}

struct CreateTaskScreen: View {
    let theme: AppTheme

    @State private var title = ""
    @State private var selectedEmployee = ""
    @State private var deadline = Date()
    @State private var description = ""

    @State private var showConfirmScreen = false

    private let employees = EmployeeLoader.load()

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    Text("Создание задачи")
                        .font(.title.bold())

                    TextField("Название задачи", text: $title)
                        .textFieldStyle(.roundedBorder)

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Ответственный сотрудник")
                            .font(.caption)
                            .foregroundColor(.secondary)

                        Picker("Ответственный сотрудник", selection: $selectedEmployee) {
                            Text("Выберите сотрудника").tag("")

                            ForEach(employees) { employee in
                                Text(employee.name).tag(employee.name)
                            }
                        }
                        .pickerStyle(.menu)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(12)
                    }

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Срок выполнения")
                            .font(.caption)
                            .foregroundColor(.secondary)

                        DatePicker(
                            "Дата",
                            selection: $deadline,
                            displayedComponents: .date
                        )
                        .datePickerStyle(.compact)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(12)
                    }

                    TextField("Описание задачи", text: $description, axis: .vertical)
                        .textFieldStyle(.roundedBorder)
                        .lineLimit(4...6)

                    Button {
                        showConfirmScreen = true
                    } label: {
                        Text("Продолжить")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(theme.accent)
                            .cornerRadius(16)
                    }
                    .disabled(title.isEmpty || selectedEmployee.isEmpty)
                    .opacity(title.isEmpty || selectedEmployee.isEmpty ? 0.5 : 1)
                }
                .padding()
            }
            .navigationDestination(isPresented: $showConfirmScreen) {
                ConfirmTaskScreen(
                    theme: theme,
                    title: title,
                    employee: selectedEmployee,
                    deadline: deadline,
                    description: description
                )
            }
        }
    }
}


struct InfoRow: View {
    let title: String
    let value: String

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)

            Text(value)
                .font(.headline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct ConfirmTaskScreen: View {
    let theme: AppTheme

    let title: String
    let employee: String
    let deadline: Date
    let description: String

    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            Text("Подтверждение задачи")
                .font(.title.bold())

            PremiumCard {
                VStack(alignment: .leading, spacing: 14) {
                    InfoRow(title: "Название", value: title)
                    InfoRow(title: "Ответственный", value: employee)
                    InfoRow(title: "Срок", value: deadline.taskFormat)
                    InfoRow(title: "Описание", value: description.isEmpty ? "Не указано" : description)
                }
            }

            Text("Введённые на предыдущем экране данные были успешно переданы на экран подтверждения.")
                .font(.subheadline)
                .foregroundColor(.secondary)

            Button {
                let newTask = TaskItem(
                    title: title,
                    employee: employee,
                    deadline: deadline,
                    taskDescription: description
                )

                modelContext.insert(newTask)

                do {
                    try modelContext.save()
                    dismiss()
                } catch {
                    print("Ошибка сохранения задачи: \(error)")
                }
            } label: {
                Text("Сохранить задачу")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(theme.accent)
                    .cornerRadius(16)
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Проверка данных")
        .navigationBarTitleDisplayMode(.inline)
    }
}
