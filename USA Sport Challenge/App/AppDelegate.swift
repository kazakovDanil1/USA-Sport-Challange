//
//  AppDelegate.swift
//  USA Sport Challenge
//
//  Created by Kazakov Danil on 23.02.2023.
//

import UIKit
import EasyAnimation

@main
class AppDelegate:
    UIResponder,
    UIApplicationDelegate
{
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [
            UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        EasyAnimation.enable()
        
        return true
    }

    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        
        return UISceneConfiguration(
            name: "Default Configuration",
            sessionRole: connectingSceneSession.role
        )
    }

    func application(
        _ application: UIApplication,
        didDiscardSceneSessions sceneSessions: Set<UISceneSession>
    ) {

    }

}
