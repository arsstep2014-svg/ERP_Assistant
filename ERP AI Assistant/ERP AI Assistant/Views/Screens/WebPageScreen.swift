//
//  WebPageScreen.swift
//  ERP AI Assistant
//
//  Created by Алина Акимкина on 25.06.2026.
//
import SwiftUI


struct WebPageScreen: View {
    let resource: WebResource

    var body: some View {
        WebView(urlString: resource.url)
            .navigationTitle(resource.title)
            .navigationBarTitleDisplayMode(.inline)
    }
}
