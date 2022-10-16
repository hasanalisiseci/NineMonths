//
//  Date+Extension.swift
//  NineMonths
//
//  Created by Hasan Ali Şişeci on 16.10.2022.
//

import Foundation

extension Date {
    func shortDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        let dateString = dateFormatter.string(from: self)
        return "\(dateString)"
    }
}
