//
//  WebView.swift
//  HrNJU
//
//  Created by apple on 2019/12/23.
//  Copyright © 2019 kadaoa. All rights reserved.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    typealias UIViewType = WKWebView
    var webUrl = "https://www.baidu.com"
    
    func makeUIView(context: UIViewRepresentableContext<WebView>) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {
        uiView.load(URLRequest(url: URL(string: webUrl)!))
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(webUrl: "https://hr.nju.edu.cn")
    }
}
