//
//  MonthByMonthModel.swift
//  NineMonths
//
//  Created by Hasan Ali Şişeci on 15.10.2022.
//

import Foundation

struct MonthByMonth: Codable, Hashable, Identifiable {
    var id: Int { description.count }
    var title: String
    var month: Int
    var description: String
    var watchOutTitle: String
    var watchOutThings: [String]
    var embryoPhotoUrl: String
}
