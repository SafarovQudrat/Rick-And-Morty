//
//  AppDelegate.swift
//  Rick And Morty
//
//  Created by MacBook Pro on 26/12/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let navvc = UINavigationController(rootViewController: MainVC(nibName: "MainVC", bundle: nil)) 
        window?.rootViewController = navvc
        window?.makeKeyAndVisible()
        return true
    }

   


}

