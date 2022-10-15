//
//  String+Extension.swift
//  NineMonths
//
//  Created by Hasan Ali Şişeci on 15.10.2022.
//

import Foundation

extension String {
    func localized() -> String {
        return NSLocalizedString(
            self,
            tableName: "Localizable",
            bundle: .main,
            value: self,
            comment: self)
    }
}

extension String {
    func caseInsensitiveHasPrefix(_ prefix: String) -> Bool {
        return lowercased().starts(with: prefix.lowercased())
    }
}
