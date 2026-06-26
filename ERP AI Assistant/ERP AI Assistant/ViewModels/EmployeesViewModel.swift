//
//  EmployeesViewModel.swift
//  ERP AI Assistant
//
//  Created by Алина Акимкина on 26.06.2026.
//

import Foundation

@MainActor
final class EmployeesViewModel: ObservableObject {
    @Published var employees: [Employee] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    func loadEmployees() async {
        isLoading = true
        errorMessage = nil

        do {
            employees = try await EmployeesAPIService.shared.fetchEmployees()
        } catch {
            if (error as NSError).code == NSURLErrorCancelled {
                isLoading = false
                return
            }

            print("API ERROR:", error)
            errorMessage = "Не удалось загрузить сотрудников"
        }

        isLoading = false
    }
}
