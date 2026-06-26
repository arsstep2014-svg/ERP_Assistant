//
//  ResourcesScreen.swift
//  ERP AI Assistant
//
//  Created by Алина Акимкина on 25.06.2026.
//

import SwiftUI

struct ResourcesScreen: View {
    let theme: AppTheme

    private let resources: [WebResource] = [
        WebResource(
            title: "ERP-системы",
            description: "Что такое ERP?",
            url: "https://habr.com/ru/articles/810741/"
        ),
        WebResource(
            title: "Бизнес-аналитика",
            description: "Базовые понятия бизнес-анализа и применение их в работе",
            url: "https://habr.com/ru/articles/933552/"
        ),
        WebResource(
            title: "Искусственный интеллект",
            description: "Исскуственный интеллект для начинающих: как всё устроено",
            url: "https://habr.com/ru/articles/952700/"
        ),
        WebResource(
            title: "Управление задачами",
            description: "Что такое управление задачами: основные советы и рекомендуемые инструменты",
            url: "https://xmind.com/ru/blog/task-management"
        )
    ]

    var body: some View {
        List(resources) { resource in
            NavigationLink {
                WebPageScreen(resource: resource)
            } label: {
                VStack(alignment: .leading, spacing: 6) {
                    Text(resource.title)
                        .font(.headline)

                    Text(resource.description)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding(.vertical, 6)
            }
        }
        .navigationTitle("Полезные ресурсы")
    }
}
