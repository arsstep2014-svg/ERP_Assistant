//
//  Employee.swift
//  ERP AI Assistant
//
//  Created by Алина Акимкина on 25.06.2026.
//


struct Employee: Identifiable, Codable {
    let id: Int
    let name: String
    let position: String
    let department: String
    let initials: String
}

