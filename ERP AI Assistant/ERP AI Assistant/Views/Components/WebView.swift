//
//  WebView.swift
//  ERP AI Assistant
//
//  Created by Алина Акимкина on 25.06.2026.
//

import SwiftUI
import WebKit


struct WebView: UIViewRepresentable {
    let urlString: String

    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        guard let url = URL(string: urlString) else {
            return
        }

        let request = URLRequest(url: url)
        webView.load(request)
    }
}
