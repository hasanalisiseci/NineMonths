//
//  NineMonthsApp.swift
//  NineMonths
//
//  Created by Hasan Ali Şişeci on 14.10.2022.
//

import SwiftUI

@main
struct NineMonthsApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            HomeScene()
        }
    }
}
