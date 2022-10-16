//
//  DetailScene.swift
//  NineMonths
//
//  Created by Hasan Ali Şişeci on 15.10.2022.
//

import SwiftUI

struct MonthlyDetailScene: View {
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
        }
        .onAppear {
            FirebaseAnalyticsManager.shared.event(eventName: "monthly_detail_scene", eventDescription: "Monthly detail scene opened.")
        }
        .padding()
        .navigationTitle(Text("\(item.title)"))
        .navigationBarTitleDisplayMode(.large)
    }
}

struct MonthlyDetailScene_Previews: PreviewProvider {
    static var previews: some View {
        MonthlyDetailScene(item: MonthByMonth(title: "", month: 1, description: "", watchOutTitle: "", watchOutThings: [], embryoPhotoUrl: ""))
    }
}
