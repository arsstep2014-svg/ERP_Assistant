//
//  APIService.swift
//  ERP AI Assistant
//
//  Created by Алина Акимкина on 25.06.2026.
//

import Foundation

final class EmployeesAPIService {
    static let shared = EmployeesAPIService()

    private let urlString = "https://6a3d6d4ad8e212699e23e509.mockapi.io/employees/erp_assistant/employees"

    func fetchEmployees() async throws -> [Employee] {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        if let httpResponse = response as? HTTPURLResponse {
            print("STATUS CODE:", httpResponse.statusCode)
        }

        let json = String(data: data, encoding: .utf8) ?? "Нет данных"
        print("RAW JSON:", json)

        return try JSONDecoder().decode([Employee].self, from: data)
    }
}
