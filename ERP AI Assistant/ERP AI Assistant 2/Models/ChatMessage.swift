//
//  Untitled.swift
//  ERP AI Assistant
//
//  Created by Алина Акимкина on 25.06.2026.
//
import Foundation

struct ChatMessage: Identifiable {
    let id = UUID()
    let text: String
    let isUser: Bool
}

