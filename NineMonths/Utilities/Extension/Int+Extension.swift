//
//  Int+Extension.swift
//  NineMonths
//
//  Created by Hasan Ali Şişeci on 15.10.2022.
//

import Foundation

extension Int {
    var toStr: String {
        return String(self)
    }
}

extension Int {
    func detectLanguage() -> String {
        let localeLang = Locale.current.languageCode
        if localeLang == "en" {
            switch self {
            case 1:
                return "st "
            case 2:
                return "nd "
            case 3:
                return "rd "
            default:
                return "th "
            }
        } else {
            return ". "
        }
    }
}
