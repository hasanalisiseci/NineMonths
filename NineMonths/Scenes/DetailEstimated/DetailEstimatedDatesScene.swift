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

                VStack(alignment: .leading) {
                    Text(Constants.probableDateOfGetPregnant).font(.title2)
                    Text(viewModel.probableDateOfGetPregnant).rowValueModifier()
                }
                VStack(alignment: .leading) {
                    Text(Constants.fetalAge).font(.title2)
                    Text(viewModel.fetalWeek + viewModel.fetalDay)
                        .rowValueModifier()
                }
                VStack(alignment: .leading) {
                    Text(Constants.heartbeat).font(.title2)
                    Text(viewModel.firstDateOfHeartbeatOnUltrasound + " - " + viewModel.secondDateOfHeartbeatOnUltrasound)
                        .rowValueModifier()
                    Text("7 - 8 \(Constants.week)")
                        .bold().font(.callout)
                }
                VStack(alignment: .leading) {
                    Text(Constants.doubleMarkerTest).font(.title2)
                    Text(viewModel.firstDateOfDoubleMarkerTest + " - " + viewModel.secondDateOfDoubleMarkerTest)
                        .rowValueModifier()
                    Text("12 - 13 \(Constants.week)")
                        .bold().font(.callout)
                }
                VStack(alignment: .leading) {
                    Text(Constants.quadrupleTest).font(.title2)
                    Text(viewModel.firstDateOfQuadrupleTest + " - " + viewModel.secondDateOfQuadrupleTest)
                        .rowValueModifier()
                    Text("16 - 18 \(Constants.week)")
                        .bold().font(.callout)
                }
                VStack(alignment: .leading) {
                    Text(Constants.organScreening).font(.title2)
                    Text(viewModel.organScreening)
                        .rowValueModifier()
                    Text("20 - 22 \(Constants.week)")
                        .bold().font(.callout)
                }
                VStack(alignment: .leading) {
                    Text(Constants.cervicalLength).font(.title2)
                    Text(viewModel.bestDateOfservicalLength)
                        .rowValueModifier()
                }
                VStack(alignment: .leading) {
                    Text(Constants.probableZodiacSign).font(.title2)
                    Text(viewModel.probableZodiacSign)
                        .rowValueModifier()
                }
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
