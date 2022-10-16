//
//  EstimatedBirthView.swift
//  NineMonths
//
//  Created by Hasan Ali Şişeci on 15.10.2022.
//

import SwiftUI

struct EstimatedDateView: View {
    @ObservedObject var viewModel = EstimatedDatesViewModel()

    var body: some View {
        ZStack {
            VStack {
                DatePicker(selection: $viewModel.satDate, in: ...Date(), displayedComponents: .date) {
                    HStack {
                        Text(Constants.selectSAT).foregroundColor(.primary).bold().font(.title2)
                    }
                }.padding()
                Spacer()
                Text(Constants.probableDateOfBirth).font(.title2).multilineTextAlignment(.center)
                Text(viewModel.estimatedBirthDate)
                    .bold().font(.largeTitle)
                Spacer()

                NavigationLink(destination: DetailEstimatedDatesScene(viewModel: viewModel)) {
                    HStack {
                        Spacer()
                        Text(Constants.forMore).foregroundColor(.primary)
                        Image(systemName: "chevron.right").foregroundColor(.primary)
                    }
                }.padding()
            }
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
