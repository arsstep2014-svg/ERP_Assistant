//
//  AIScreen.swift
//  ERP AI Assistant
//
//  Created by Алина Акимкина on 25.06.2026.
//
import SwiftUI
import SwiftData


struct AIScreen: View {
    let theme: AppTheme
    
    @Query(sort: \TaskItem.createdAt, order: .reverse)
    private var savedTasks: [TaskItem]
    
    @State private var inputText = ""
    @State private var messages: [ChatMessage] = [
        ChatMessage(text: "Приветствую, пользователь!\nЯ Business AI-ассистент. Введите запрос или выберите действие ниже.", isUser: false)
    ]

    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                    HeaderView(title: "Здравствуйте, Арсений 👋", subtitle: "Ваш AI-ассистент для работы с ERP-системой", theme: theme)
                    
                    PremiumCard {
                        HStack {
                            VStack(alignment: .leading, spacing: 14) {
                                Text("ПОСЛЕДНЕЕ ДЕЙСТВИЕ")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                
                                Text(lastTaskText)
                                    .font(.headline)
                                
                                HStack(spacing: 18) {
                                    Label(lastTaskDateText, systemImage: "calendar")
                                    Label(lastTaskTimeText, systemImage: "clock")
                                }
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                            
                            RoundedRectangle(cornerRadius: 18)
                                .fill(theme.soft)
                                .frame(width: 64, height: 64)
                                .overlay {
                                    Image(systemName: "checkmark")
                                        .font(.title2)
                                        .foregroundColor(theme.accent)
                                }
                        }
                    }
                    
                    PremiumCard {
                        VStack(alignment: .leading, spacing: 18) {
                            HStack {
                                Label("AI-АССИСТЕНТ", systemImage: "sparkles")
                                    .font(.headline)
                                    .foregroundColor(theme.accent)
                                
                                Spacer()
                                
                                Image(systemName: "ellipsis")
                                    .foregroundColor(.secondary)
                            }
                            
                            ForEach(messages) { message in
                                HStack {
                                    if message.isUser { Spacer() }
                                    
                                    Text(message.text)
                                        .font(.subheadline)
                                        .padding()
                                        .background(message.isUser ? theme.accent : theme.soft)
                                        .foregroundColor(message.isUser ? .white : .primary)
                                        .cornerRadius(18)
                                        .frame(maxWidth: 285, alignment: message.isUser ? .trailing : .leading)
                                    
                                    if !message.isUser { Spacer() }
                                }
                            }
                            
                            HStack {
                                TextField("Спросите ассистента...", text: $inputText)
                                    .padding()
                                    .background(Color(.secondarySystemBackground))
                                    .cornerRadius(18)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 18)
                                            .stroke(Color.black.opacity(0.08))
                                    }
                                
                                Button {
                                    sendMessage()
                                } label: {
                                    Image(systemName: "arrow.up")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .frame(width: 48, height: 48)
                                        .background(theme.accent)
                                        .clipShape(RoundedRectangle(cornerRadius: 16))
                                }
                            }
                            
                            HStack {
                                QuickButton(title: "Создать задачу", icon: "checklist", theme: theme)
                                QuickButton(title: "Показать отчёт", icon: "chart.bar", theme: theme)
                                QuickButton(title: "Аналитика", icon: "chart.pie", theme: theme)
                            }
                            
                            NavigationLink {
                                ResourcesScreen(theme: theme)
                            } label: {
                                Label("Полезные ресурсы", systemImage: "globe")
                                    .font(.caption)
                                    .foregroundColor(.primary)
                                    .padding(.vertical, 12)
                                    .frame(maxWidth: .infinity)
                                    .background(theme.soft)
                                    .cornerRadius(14)
                            }
                        }
                    }
                    
                    ProgressCard(theme: theme)
                    
                }
                .padding()
            }
        }
    }
    
    private var lastTaskText: String {
        if let task = savedTasks.first {
            return "Добавлена задача: \(task.title)"
        } else {
            return "Пока задачи не добавлены"
        }
    }
    
    private var lastTaskDateText: String {
        savedTasks.first?.createdAt.taskFormat ?? "Нет данных"
    }

    private var lastTaskTimeText: String {
        savedTasks.first?.createdAt.formatted(
            .dateTime
                .hour()
                .minute()
                .locale(Locale(identifier: "ru_RU"))
        ) ?? "--:--"
    }

    private func sendMessage() {
        let text = inputText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !text.isEmpty else { return }

        messages.append(ChatMessage(text: text, isUser: true))
        inputText = ""

        messages.append(ChatMessage(text: "Запрос распознан. После подключения сервера задача будет добавлена в ERP-систему.", isUser: false))
    }
}
