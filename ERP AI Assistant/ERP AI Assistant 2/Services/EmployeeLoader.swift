//
//  Untitled.swift
//  ERP AI Assistant
//
//  Created by Алина Акимкина on 25.06.2026.
//
import Foundation

struct EmployeeLoader {

    static func load() -> [Employee] {

        guard let url = Bundle.main.url(
            forResource: "employees",
            withExtension: "json"
        ) else {

            print("JSON файл не найден")
            return []
        }

        do {

            let data = try Data(contentsOf: url)

            let employees = try JSONDecoder().decode(
                [Employee].self,
                from: data
            )

            return employees

        } catch {

            print("Ошибка загрузки JSON:", error)
            return []

        }
    }
}
