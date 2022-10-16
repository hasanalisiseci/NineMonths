//
//  Text+Extension.swift
//  NineMonths
//
//  Created by Hasan Ali Şişeci on 16.10.2022.
//

import Foundation
import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2.bold())
            .foregroundColor(.accentColor)

    }
}

extension Text {
    func rowValueModifier() -> some View {
        self.bold()
            .modifier(TitleModifier())
    }
}
