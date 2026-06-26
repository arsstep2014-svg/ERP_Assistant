//
//  ERPTask.swift
//  ERP AI Assistant
//
//  Created by Алина Акимкина on 25.06.2026.
//
import Foundation

struct ERPTask: Identifiable {
    let id = UUID()
    let title: String
    let employee: String
    let deadline: String
    let status: String
}
