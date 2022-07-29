//
//  VideoView.swift
//  Learneur
//
//  Created by Piter Wongso on 22/07/22.
//

import SwiftUI
import WebKit

struct VideoView : UIViewRepresentable {
    
    let videoID: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)") else {
            return
        }
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: youtubeURL))
    }
    
}

struct WebView : UIViewRepresentable {
    
    let webID: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string: "\(webID)") else {
            return
        }
        uiView.scrollView.isScrollEnabled = true
        uiView.load(URLRequest(url: youtubeURL))
    }
    
}
