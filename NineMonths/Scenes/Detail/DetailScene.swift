//
//  DetailScene.swift
//  NineMonths
//
//  Created by Hasan Ali Şişeci on 15.10.2022.
//

import SwiftUI

struct DetailScene: View {
    var item: MonthByMonth

    var body: some View {
        VStack(alignment: .leading) {
            ScrollView {
                Text(item.description).font(.title3)
                    .padding()
                VStack(alignment: .leading) {
                    Text(Constants.watchOutTitleFirstPart + " " + item.month.toStr + item.month.detectLanguage() + Constants.watchOutTitleSecondPart)
                        .padding()
                        .font(.system(size: 20, weight: .bold))
                    ForEach(item.watchOutThings, id: \.self) { item in
                        DetailThingsCell(thing: item).padding(.top)
                    }
                }
            }
        }.padding()
            .navigationTitle(Text("\(item.month) \(Constants.monthlyPregnant)"))
            .navigationBarTitleDisplayMode(.large)
    }
}

struct DetailScene_Previews: PreviewProvider {
    static var previews: some View {
        DetailScene(item: MonthByMonth(month: 1, description: "", watchOutThings: [], embryoPhotoUrl: ""))
    }
}
