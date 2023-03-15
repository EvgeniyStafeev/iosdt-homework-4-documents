//
//  AppDelegate.swift
//  Documents
//
//  Created by Евгений Стафеев on 14.03.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let passwordView = PasswordViewController(toUpdatePassword: false)
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = passwordView
        window?.makeKeyAndVisible()
        return true
    }
}

