//
//  DetailRow.swift
//  NineMonths
//
//  Created by Hasan Ali Şişeci on 20.10.2022.
//

import SwiftUI

struct DetailRow: View {
    var title: String
    var value: String
    var range: String? = ""

    var body: some View {
        VStack(alignment: .leading) {
            Text(title).font(.title2)
            Text(value).rowValueModifier()
            if !range!.isEmpty {
                Text(range!)
                    .bold().font(.callout)
            }
        }
    }
}

struct DetailRow_Previews: PreviewProvider {
    static var previews: some View {
        DetailRow(title: "", value: "", range: "")
    }
}
