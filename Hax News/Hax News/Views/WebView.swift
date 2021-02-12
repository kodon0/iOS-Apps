//
//  WebView.swift
//  Hax News
//
//  Created by Kieran O'Donnell on 12/02/2021.
//  Copyright © 2021 baxmanduppa. All rights reserved.
//

import Foundation
import WebKit
import SwiftUI

//Struct to show url content
//Need to create own WebView (subject to Swift UI updates...)
struct WebView: UIViewRepresentable {
    
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString) {
            let request = URLRequest(url: url)
            uiView.load(request)
            }
            
        }
    }
}
