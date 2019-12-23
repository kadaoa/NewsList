//
//  SceneDelegate.swift
//  HrNJU
//
//  Created by apple on 2019/12/23.
//  Copyright © 2019 kadaoa. All rights reserved.
//

import UIKit
import SwiftUI
import Kanna

var htmlString:String = try! String(contentsOf: URL(string: "https://hr.nju.edu.cn/")!, encoding: String.Encoding.utf8) 


class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        // Create the SwiftUI view that provides the window contents.
        
        
        if let htmlDoc = try? HTML(html: htmlString, encoding: .utf8){
            print(htmlDoc.title!)

            var newsName:String = ""
            var newsTime:String = ""
            var readTimes:String = ""
            var newsHref:String = ""
            var dataIndex:Int = 0
            for newsList in htmlDoc.css(".news_list"){
                for news in newsList.css(".news"){
                    for Title in news.css(".news_title a")
                    {
                        newsName=Title["title"]!
                        newsHref=Title["href"]!
                    }
                    for Time in news.css(".news_meta")
                    {
                        newsTime=Time.text!
                    }
                    for Times in news.css(".news_meta1")
                    {
                        readTimes=Times.innerHTML!
                    }
                    print(newsName,newsTime,readTimes)
                    newsData[dataIndex].append(News(newsName: newsName, newsTime: newsTime, readTimes: Int(readTimes.split(separator: ")")[0].split(separator: "(")[0])!, subHref: newsHref))
                }
                dataIndex += 1
            }
        }
        let contentView = ContentView()

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

