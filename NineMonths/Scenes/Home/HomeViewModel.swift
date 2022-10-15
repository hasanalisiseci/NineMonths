//
//  HomeViewModel.swift
//  NineMonths
//
//  Created by Hasan Ali Şişeci on 15.10.2022.
//

import Foundation

class HomeViewModel: NSObject, ObservableObject {
    @Published var monthByMonthPregnancy: [MonthByMonth?] = []
    @Published var weekByWeekPregnancy: [WeekByWeek] = []

    override init() {
        super.init()
        getMonthByMonthInfos()
        getWeekByWeekInfos()
    }

    private func getMonthByMonthInfos() {
        FirestoreManager<MonthByMonth>().get(by: "month") { monthResult, error  in
            if let monthResult = monthResult {
                self.monthByMonthPregnancy = monthResult
            } else {
                fatalError("Unable to retrieve the saved Book object")
            }
        }
    }
    
    private func getWeekByWeekInfos() {
        FirestoreManager<WeekByWeek>().get(by: "week") { weekResult, error  in
            if let weekResult = weekResult {
                print(weekResult)
            } else {
                fatalError("Unable to retrieve the saved Book object")
            }
        }
    }
}
