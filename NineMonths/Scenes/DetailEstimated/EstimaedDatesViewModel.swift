//
//  DetailEstimaedDateViewModel.swift
//  NineMonths
//
//  Created by Hasan Ali Şişeci on 16.10.2022.
//

import Foundation
import SwiftUI

class EstimatedDatesViewModel: NSObject, ObservableObject {
    @Published var satDate = Date() // Son adet tarihi

    var probableDateOfGetPregnant: String {
        // probable date of get pregnant -> sat + 2 week
        return addWeek(weekCount: 2)
    }

    var firstDateOfHeartbeatOnUltrasound: String {
        // probable date of get heartbeat -> sat + 7 - 8 week
        return addWeek(weekCount: 7)
    }

    var secondDateOfHeartbeatOnUltrasound: String {
        // probable date of get heartbeat -> sat + 7 - 8 week
        return addWeek(weekCount: 8)
    }

    var firstDateOfDoubleMarkerTest: String {
        // probable date of get double test -> sat + 12 - 13 week
        return addWeek(weekCount: 12)
    }

    var secondDateOfDoubleMarkerTest: String {
        // probable date of get double test -> sat + 12 - 13 week
        return addWeek(weekCount: 13)
    }

    var firstDateOfQuadrupleTest: String {
        // probable date of get double test -> sat + 16 - 18 week
        return addWeek(weekCount: 16)
    }

    var secondDateOfQuadrupleTest: String {
        // probable date of get double test -> sat + 16 - 18 week
        return addWeek(weekCount: 18)
    }

    var organScreening: String {
        // probable date of get organ screening  -> sat + 20 -22 week
        return addWeek(weekCount: 20)
    }

    var bestDateOfservicalLength: String {
        // probable date of get servical length  -> sat + 16 week
        return addWeek(weekCount: 16)
    }

    var fetalWeek: String {
        let temp = Int(Date().timeIntervalSince1970 - satDate.timeIntervalSince1970)
        let week = temp / 604800
        if week == 0 {
            return ""
        } else {
            return "\(week) \(Constants.week)"
        }
    }

    var fetalDay: String {
        let temp = Int(Date().timeIntervalSince1970 - satDate.timeIntervalSince1970)
        let day = (temp / 86400) % 7
        return "\(day) \(Constants.day)"
    }

    var estimatedBirthDate: String {
        // probable date of get servical length  -> sat + 40 week
        return addWeek(weekCount: 40)
    }

    override init() {
        super.init()
    }

    func addWeek(weekCount: Int) -> String {
        Calendar.current.date(byAdding: .weekOfYear, value: weekCount, to: satDate)!.shortDate()
    }
}
