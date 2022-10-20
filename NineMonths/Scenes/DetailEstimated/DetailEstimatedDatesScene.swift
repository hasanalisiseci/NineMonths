//
//  DetailEstimatedDateOfBirth.swift
//  NineMonths
//
//  Created by Hasan Ali Şişeci on 15.10.2022.
//

import SwiftUI

struct DetailEstimatedDatesScene: View {
    @StateObject var viewModel: EstimatedDatesViewModel

    var body: some View {
        NavigationView {
            List {
                DatePicker(selection: $viewModel.satDate, in: ...Date(), displayedComponents: .date) {
                    Text(Constants.selectSAT).foregroundColor(.primary).bold().font(.title2)
                }
                DetailRow(title: Constants.probableDateOfGetPregnant,
                          value: viewModel.probableDateOfGetPregnant)
                DetailRow(title: Constants.fetalAge,
                          value: viewModel.fetalWeek + (viewModel.fetalWeek.isEmpty ? "" : " "))
                DetailRow(title: Constants.heartbeat,
                          value: viewModel.firstDateOfHeartbeatOnUltrasound + " - " + viewModel.secondDateOfHeartbeatOnUltrasound,
                          range: "7 - 8 \(Constants.week)")
                DetailRow(title: Constants.doubleMarkerTest,
                          value: viewModel.firstDateOfQuadrupleTest + " - " + viewModel.secondDateOfQuadrupleTest,
                          range: "16 - 18 \(Constants.week)")
                DetailRow(title: Constants.organScreening,
                          value: viewModel.organScreening,
                          range: "20 - 22 \(Constants.week)")
                DetailRow(title: Constants.cervicalLength,
                          value: viewModel.bestDateOfservicalLength)
                DetailRow(title: Constants.probableZodiacSign,
                          value: viewModel.probableZodiacSign)
                VStack(alignment: .center) {
                    Text(Constants.probableDateOfBirth).font(.title2)
                    Text(viewModel.estimatedBirthDate)
                        .bold().font(.largeTitle).foregroundColor(.accentColor)
                }
            }
        }
        .onAppear {
            FirebaseAnalyticsManager.shared.event(eventName: "estimated_detail_scene", eventDescription: "Estimated detail scene opened")
        }
        .navigationTitle(Constants.probableDateOfBirth)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailEstimatedDatesScene_Previews: PreviewProvider {
    static var previews: some View {
        DetailEstimatedDatesScene(viewModel: EstimatedDatesViewModel())
    }
}
