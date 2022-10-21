//
//  HomeScene.swift
//  NineMonths
//
//  Created by Hasan Ali Şişeci on 15.10.2022.
//

import AppTrackingTransparency
import FirebaseAnalytics
import FirebaseAuth
import SwiftUI

struct HomeScene: View {
    @ObservedObject var homeViewModel = HomeViewModel()
    @ObservedObject var estimatedViewModel = EstimatedDatesViewModel()

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(content: {
                    HStack {
                        Text(Constants.weekByWeekPreg).bold().font(.title).padding(.horizontal).padding(.top, 20)
                        Spacer()
                    }.padding(.leading,5)
                    if homeViewModel.weekByWeekPregnancy.isEmpty {
                        ProgressView()
                            .frame(width: UIScreen.screenWidth, height: UIScreen.screenWidth * 0.6)
                    } else {
                        VStack {
                            GeometryReader { reader in
                                VStack(alignment: .center) {
                                    TabView {
                                        ForEach(homeViewModel.weekByWeekPregnancy, id: \.self) { item in
                                            NavigationLink(destination: WeeklyDetailScene(item: item!)) {
                                                WeeklyCell(model: item!)
                                            }.padding().tag(estimatedViewModel.whickWeek)
                                        }
                                    }
                                    .tabViewStyle(.page(indexDisplayMode: PageTabViewStyle.IndexDisplayMode.never))
                                    .frame(width: reader.size.width, height: UIScreen.screenHeight * 0.25)
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight * 0.25)
                        }
                    }
                    HStack {
                        Text(Constants.monthByMontyPreg).bold().font(.title).padding(.horizontal).padding(.top, 20)
                        Spacer()
                    }.padding(.leading,5)
                    EstimatedDateView(viewModel: estimatedViewModel)
                    HStack {
                        Text(Constants.monthByMontyPreg).bold().font(.title).padding(.horizontal).padding(.top, 20)
                        Spacer()
                    }.padding(.leading,5)
                    if homeViewModel.monthByMonthPregnancy.isEmpty {
                        ProgressView()
                            .frame(width: UIScreen.screenWidth * 0.9, height: UIScreen.screenWidth * 0.9)
                    } else {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(homeViewModel.monthByMonthPregnancy, id: \.self) { item in
                                NavigationLink(destination: MonthlyDetailScene(item: item!)) {
                                    MonthlyCell(item: item!)
                                }
                            }
                        }.padding(.horizontal)
                    }

                    NavigationLink(destination: NameScene()) {
                        RoundedButtonView(imageURL: NetworkManager.babyImageURL, title: Constants.trendBabyNames)
                    }
                    Spacer()
                })
                .navigationTitle(Text(Constants.appName))
            }
        }.onAppear {
            FirebaseAnalyticsManager.shared.event(eventName: "homeScene", eventDescription: "App opened.")
            if #available(iOS 14, *) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                    ATTrackingManager.requestTrackingAuthorization { status in
                        if status == .authorized {
                            Analytics.logEvent(AnalyticsEventScreenView,
                                               parameters: [AnalyticsParameterScreenName: "\(type(of: self))",
                                                            AnalyticsParameterScreenClass: "\(type(of: self))"])
                        }
                    }
                })
            }
        }
    }
}

struct HomeScene_Previews: PreviewProvider {
    static var previews: some View {
        HomeScene()
    }
}
