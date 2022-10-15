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
                    Text(item.watchOutTitle)
                        .padding()
                        .font(.system(size: 20, weight: .bold))
                    ForEach(item.watchOutThings, id: \.self) { item in
                        DetailThingsCell(thing: item).padding(.top)
                    }
                }
            }
        }.padding()
            .navigationTitle(Text("\(item.title)"))
            .navigationBarTitleDisplayMode(.large)
    }
}

struct DetailScene_Previews: PreviewProvider {
    static var previews: some View {
        DetailScene(item: MonthByMonth(title: "", month: 1, description: "", watchOutTitle: "", watchOutThings: [], embryoPhotoUrl: ""))
    }
}
