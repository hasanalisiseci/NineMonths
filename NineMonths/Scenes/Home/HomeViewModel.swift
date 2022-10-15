//
//  HomeViewModel.swift
//  NineMonths
//
//  Created by Hasan Ali Şişeci on 15.10.2022.
//

import Foundation

class HomeViewModel: NSObject, ObservableObject {
    @Published var monthByMonthPregnancy: [MonthByMonthModel] = []

    override init() {
        super.init()
        getMonthByMonthInfos()
    }

    private func getMonthByMonthInfos() {
        FirestoreManager.shared.getDocuments(collectionName: PathNames.MonthByMonth.rawValue, by: "month") { [weak self] result in

            guard let self = self else { return }

            switch result {
            case let .success(data):
                self.monthByMonthPregnancy = data
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
}
