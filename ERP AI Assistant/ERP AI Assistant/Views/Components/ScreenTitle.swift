//
//  ScreenTitle.swift
//  ERP AI Assistant
//
//  Created by Алина Акимкина on 25.06.2026.
//

import SwiftUI

struct ScreenTitle: View {
    let title: String

    init(_ title: String) {
        self.title = title
    }

    var body: some View {
        Text(title)
            .font(.system(size: 28, weight: .semibold))
            .padding(.top, 10)
    }
}
