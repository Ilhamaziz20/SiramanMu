//
//  AppDelegate.swift
//  DzikirSiramanMu
//
//  Created by Muhammad Ilham Aziz on 27/12/23.
//

import UIKit
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let nc = UINavigationController(rootViewController: DzikirViewController(nibName: String(describing: DzikirViewController.self), bundle: nil))
        self.window?.rootViewController = nc
        self.window?.makeKeyAndVisible()
        
        return true
    }}


