//
//  NamesCell.swift
//  NineMonths
//
//  Created by Hasan Ali Şişeci on 15.10.2022.
//

import SwiftUI

struct NameCell: View {
    var model: NameModel
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                Image(model.sex == "K" ? Image.girlIcon : Image.boyIcon)
                    .resizable()
                    .frame(width: 50, height: 50)
                VStack(alignment: .leading) {
                    Text(model.name).font(.title2)
                    Text(model.mean).font(.body)
                }.padding(.leading, 5)
                Spacer()
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 5)
    }
}
