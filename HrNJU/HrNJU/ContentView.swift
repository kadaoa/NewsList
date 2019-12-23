//
//  ContentView.swift
//  HrNJU
//
//  Created by apple on 2019/12/23.
//  Copyright © 2019 kadaoa. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("人事通知")){
                    ForEach(newsData[0] as! [News]){ news in
                        NavigationLink(destination: WebView(webUrl: news.newsHref)){
                            NewsCellView(news: news)
                        }
                    }
                }
                Section(header: Text("人事新闻")){
                    ForEach(newsData[1] as! [News]){ news in
                        NavigationLink(destination: WebView(webUrl: news.newsHref)){
                            NewsCellView(news: news)
                        }
                    }
                }
                Section(header: Text("公示公告")){
                    ForEach(newsData[2] as! [News]){ news in
                        NavigationLink(destination: WebView(webUrl: news.newsHref)){
                            NewsCellView(news: news)
                        }
                    }
                }
                Section(header: Text("招聘信息")){
                    ForEach( newsData[3] as! [News]){ news in
                        NavigationLink(destination: WebView(webUrl: news.newsHref)){
                            NewsCellView(news: news)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("南大人事"),displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
