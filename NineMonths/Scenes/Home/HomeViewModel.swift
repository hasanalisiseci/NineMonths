//
//  HomeViewModel.swift
//  NineMonths
//
//  Created by Hasan Ali Şişeci on 15.10.2022.
//

import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import Foundation

class HomeViewModel: NSObject, ObservableObject {
    @Published var monthByMonthPregnancy: [MonthByMonth?] = []
    @Published var weekByWeekPregnancy: [WeekByWeek?] = []

    override init() {
        super.init()
        getMonthByMonthInfos()
        getWeekByWeekInfos()
    }

    private func getMonthByMonthInfos() {
        FirestoreManager<MonthByMonth>().get(by: "month") { monthResult, _ in
            if let monthResult = monthResult {
                self.monthByMonthPregnancy = monthResult

            } else {
                fatalError("Unable to retrieve the saved monthArray object")
            }
        }
    }

    private func getWeekByWeekInfos() {
        FirestoreManager<WeekByWeek>().get(by: "week") { weekResult, _ in
            if let weekResult = weekResult {
                self.weekByWeekPregnancy = weekResult

            } else {
                fatalError("Unable to retrieve the saved weekArray object")
            }
        }
    }

}
