//
//  AppDelegate.swift
//  SwiftTraining
//
//  Created by yuki noda on 2024/11/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UICollectionViewSample1ViewController()
        window?.makeKeyAndVisible()
        return true
    }
}
