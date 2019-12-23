//
//  NewCellView.swift
//  HrNJU
//
//  Created by apple on 2019/12/23.
//  Copyright © 2019 kadaoa. All rights reserved.
//

import SwiftUI

struct NewsCellView: View {
    var news:News
    var body: some View {
        HStack{
            if news.readTimes > 1000{
                Image(systemName: "flame.fill")
                    .foregroundColor(.red)
                    .frame(width: 15, height: 15)
            }else{
                Text("")
                    .frame(width: 15, height: 15)
            }
            ScrollView(.horizontal, showsIndicators: false){
                Text(news.newsName)
                    .lineLimit(1)
            }
            Spacer()
            Text(news.newsTime)
                .foregroundColor(Color.gray.opacity(1))
        }
    }
}

struct NewsCellView_Previews: PreviewProvider {
    static var previews: some View {
        NewsCellView(news:newsData[0][0] as! News)
    }
}
