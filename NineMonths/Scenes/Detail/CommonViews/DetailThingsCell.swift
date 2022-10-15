//
//  DetailThingsCell.swift
//  NineMonths
//
//  Created by Hasan Ali Şişeci on 15.10.2022.
//

import SwiftUI

struct DetailThingsCell: View {
    var thing: String
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: "checkmark.seal.fill").font(.system(size: 24))
            Text(thing).font(.body)
            Spacer()
        }
    }
}
