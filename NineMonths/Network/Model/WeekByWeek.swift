//
//  WeekByWeekModel.swift
//  NineMonths
//
//  Created by Hasan Ali Şişeci on 15.10.2022.
//

import Foundation

struct WeekByWeek: Codable, Hashable, Identifiable {
    var id: Int { description.count }
    var week: Int
    var description: String
    var imageURL: String
}
