//
//  TaskItem.swift
//  ERP AI Assistant
//
//  Created by Алина Акимкина on 25.06.2026.
//
import Foundation
import SwiftData

@Model
final class TaskItem {
    var title: String
    var employee: String
    var deadline: Date
    var taskDescription: String
    var status: String
    var createdAt: Date

    init(
        title: String,
        employee: String,
        deadline: Date,
        taskDescription: String,
        status: String = "Новая",
        createdAt: Date = Date()
    ) {
        self.title = title
        self.employee = employee
        self.deadline = deadline
        self.taskDescription = taskDescription
        self.status = status
        self.createdAt = createdAt
    }
}
