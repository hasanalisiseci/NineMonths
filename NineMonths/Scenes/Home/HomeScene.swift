//
//  HomeScene.swift
//  NineMonths
//
//  Created by Hasan Ali Şişeci on 15.10.2022.
//

import SwiftUI

struct HomeScene: View {
    @ObservedObject var homeViewModel = HomeViewModel()

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    var body: some View {
        NavigationView {
            VStack(content: {
                HStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                    }
                }
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(homeViewModel.monthByMonthPregnancy, id: \.self) { item in
                        NavigationLink(destination: DetailScene(item: item!)) {
                            MonthCell(number: item!.month, photoUrl: item!.embryoPhotoUrl)
                        }
                    }
                }
                NavigationLink(destination: NameScene()) {
                    RoundedButtonView(imageURL: NetworkManager.babyImageURL, title: Constants.trendBabyNames)
                }
                Spacer()
            })
            .padding(.horizontal)
            .navigationTitle(Text("Aydan Aya Gebelik"))
        }
    }
}

struct HomeScene_Previews: PreviewProvider {
    static var previews: some View {
        HomeScene()
    }
}
