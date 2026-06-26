//
//  Date+Format.swift
//  ERP AI Assistant
//
//  Created by Алина Акимкина on 25.06.2026.
//

import Foundation

extension Date {
    var taskFormat: String {
        self.formatted(
            .dateTime
                .day()
                .month(.wide)
                .year()
                .locale(Locale(identifier: "ru_RU"))
        )
    }
}
