//
//  WeeklyDetailScene.swift
//  NineMonths
//
//  Created by Hasan Ali Şişeci on 15.10.2022.
//

import Kingfisher
import SwiftUI

struct WeeklyDetailScene: View {
    var item: WeekByWeek

    var body: some View {
        VStack(alignment: .leading) {
            KFImage(URL(string: item.imageURL))
                .resizable()
                .placeholder { _ in
                    ProgressView()
                }
                .frame(width: UIScreen.screenWidth - 20, height: UIScreen.screenWidth * 0.5)
                .cornerRadius(12)
                .padding(.bottom)
            Text(item.description).font(.title3)
                .padding()
            Spacer()
        }
        .onAppear {
            FirebaseAnalyticsManager.shared.event(eventName: "weekly_detail_scene", eventDescription: "Weelly detail scene opened.")
        }
        .padding()
        .navigationTitle(Text("\(item.title)"))
        .navigationBarTitleDisplayMode(.large)
    }
}

struct WeeklyDetailScene_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyDetailScene(item: WeekByWeek(title: "", week: 1, description: "", imageURL: ""))
    }
}
