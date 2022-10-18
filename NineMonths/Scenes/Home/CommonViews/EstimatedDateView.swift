//
//  EstimatedBirthView.swift
//  NineMonths
//
//  Created by Hasan Ali Şişeci on 15.10.2022.
//

import SwiftUI

struct EstimatedDateView: View {
    @ObservedObject var viewModel = EstimatedDatesViewModel()
    @Environment(\.colorScheme) var colorScheme
    @State var isNavigate = false

    var body: some View {
        ZStack {
            NavigationLink(destination: DetailEstimatedDatesScene(viewModel: viewModel), isActive: $isNavigate) {}
            VStack {
                HStack {
                    Text(Constants.selectSAT).bold().font(.title2).foregroundColor(Color("EstimatedTextColor"))
                    DatePicker(selection: $viewModel.satDate, in: ...Date(), displayedComponents: .date) {}.padding().accentColor(Color("EstimatedTextColor")).colorScheme(colorScheme == .dark ? .light : .dark)
                }

                Spacer()
                Text(Constants.probableDateOfBirth).font(.title2).multilineTextAlignment(.center)
                Text(viewModel.estimatedBirthDate)
                    .bold().font(.largeTitle)
                Spacer()
                Button {
                    isNavigate.toggle()
                    FirebaseAnalyticsManager.shared.event(eventName: "estimated_detail_button_clicked", eventDescription: "Estimaed for more button is clicked")
                } label: {
                    HStack {
                        Spacer()
                        Text(Constants.forMore)
                        Image(systemName: "chevron.right")
                    }
                }.padding()
            }.padding().foregroundColor(Color("EstimatedTextColor"))
        }
        .frame(width: UIScreen.screenWidth - 20, height: UIScreen.screenWidth * 0.6)
        .background(RoundedRectangle(cornerRadius: 12)
            .frame(width: UIScreen.screenWidth - 20, height: UIScreen.screenWidth * 0.6)
            .foregroundColor(.blue).opacity(0.7))
    }
}

struct EstimatedDateView_Previews: PreviewProvider {
    static var previews: some View {
        EstimatedDateView()
    }
}
