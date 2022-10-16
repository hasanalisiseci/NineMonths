//
//  FirebaseAnalyticsManger.swift
//  NineMonths
//
//  Created by Hasan Ali Şişeci on 16.10.2022.
//

import FirebaseAnalytics
import Foundation

class FirebaseAnalyticsManager {
    static let shared = FirebaseAnalyticsManager()

    private init() {}

    func event(eventName: String, eventDescription: String) {
        Analytics.logEvent(eventName, parameters: [
            "event": eventDescription,
        ])
    }
}
