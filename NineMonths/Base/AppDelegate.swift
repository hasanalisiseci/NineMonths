//
//  AppDelegate.swift
//  NineMonths
//
//  Created by Hasan Ali Şişeci on 14.10.2022.
//

import UIKit
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
