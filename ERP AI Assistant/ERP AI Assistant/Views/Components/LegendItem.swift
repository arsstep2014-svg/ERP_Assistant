//
//  LegendItem.swift
//  ERP AI Assistant
//
//  Created by Арсений on 25.06.2026.
//
import SwiftUI


struct LegendItem: View {
    let color: Color
    let title: String
    let value: String

    var body: some View {
        HStack {
            Circle()
                .fill(color)
                .frame(width: 8, height: 8)

            Text(title)
                .font(.caption)

            Spacer()

            Text(value)
                .font(.caption)
                .bold()
        }
    }
}

