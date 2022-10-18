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

    var probableZodiacSign: String {
        let date: Date = Calendar.current.date(byAdding: .weekOfYear, value: 40, to: satDate)!
        let calendar = Calendar.current
        let d = calendar.component(.day, from: date)
        let m = calendar.component(.month, from: date)

        switch (d, m) {
        case (21 ... 31, 1), (1 ... 19, 2):
            return "aquarius".localized()
        case (20 ... 29, 2), (1 ... 20, 3):
            return "pisces".localized()
        case (21 ... 31, 3), (1 ... 20, 4):
            return "aries".localized()
        case (21 ... 30, 4), (1 ... 21, 5):
            return "taurus".localized()
        case (22 ... 31, 5), (1 ... 21, 6):
            return "gemini".localized()
        case (22 ... 30, 6), (1 ... 22, 7):
            return "cancer".localized()
        case (23 ... 31, 7), (1 ... 22, 8):
            return "leo".localized()
        case (23 ... 31, 8), (1 ... 23, 9):
            return "virgo".localized()
        case (24 ... 30, 9), (1 ... 23, 10):
            return "libra".localized()
        case (24 ... 31, 10), (1 ... 22, 11):
            return "scorpio".localized()
        case (23 ... 30, 11), (1 ... 21, 12):
            return "sagittarius".localized()
        default:
            return "capricorn".localized()
        }
    }

    override init() {
        super.init()
    }

    func addWeek(weekCount: Int) -> String {
        Calendar.current.date(byAdding: .weekOfYear, value: weekCount, to: satDate)!.shortDate()
    }
}
