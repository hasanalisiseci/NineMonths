//
//  MonthByMonthModel.swift
//  NineMonths
//
//  Created by Hasan Ali Şişeci on 15.10.2022.
//

import Foundation

struct MonthByMonth: Codable, Hashable {
    var month: Int
    var description: String
    var watchOutThings: [String]
    var embryoPhotoUrl: String
}
