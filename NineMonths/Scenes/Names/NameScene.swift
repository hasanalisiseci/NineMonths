//
//  NameScene.swift
//  NineMonths
//
//  Created by Hasan Ali Şişeci on 15.10.2022.
//

import SwiftUI

struct NameScene: View {
    @ObservedObject var namesViewModel = NamesViewModel()
    @State var searchedLetters = ""

    var body: some View {
        VStack {
            if namesViewModel.namesArray.isEmpty {
                ProgressView()
            } else {
                SearchBar(name: $searchedLetters)
                ScrollView {
                    ForEach(namesViewModel.namesArray, id: \.self) { item in
                        if searchedLetters == "" {
                            NameCell(model: item)
                        } else {
                            if item.name.caseInsensitiveHasPrefix(searchedLetters) {
                                NameCell(model: item)
                            }
                        }
                    }
                }.padding(.horizontal)
            }
        }
        .onAppear {
            FirebaseAnalyticsManager.shared.event(eventName: "names_scene", eventDescription: "Names scene opened.")
        }
        .navigationTitle(Text(Constants.trendBabyNames))
        .navigationBarTitleDisplayMode(.large)
    }
}

struct NameScene_Previews: PreviewProvider {
    static var previews: some View {
        NameScene()
    }
}
