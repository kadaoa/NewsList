//
//  News.swift
//  HrNJU
//
//  Created by apple on 2019/12/23.
//  Copyright © 2019 kadaoa. All rights reserved.
//

import Foundation

class News:Identifiable{
    var id = UUID()
    var newsName:String = ""
    var newsTime:String = ""
    var readTimes:Int = 0
    var newsHref:String = "https://hr.nju.edu.cn"
    init(newsName:String,newsTime:String,readTimes:Int,subHref:String) {
        self.newsName=newsName
        self.newsTime=newsTime
        self.readTimes=readTimes
        self.newsHref += subHref
    }
}
