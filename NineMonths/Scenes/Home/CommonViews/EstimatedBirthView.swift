//
//  EstimatedBirthView.swift
//  NineMonths
//
//  Created by Hasan Ali Şişeci on 15.10.2022.
//

import SwiftUI

struct EstimatedBirthView: View {
    @State private var satDate = Date()
    
    private var estimatedBirthDate: Int {
        return Int(satDate.timeIntervalSince1970) + fourtyWeekTimestamp
    }

    private let formatted = Date().formatted(.dateTime.day().month(.wide).year())
    private let fourtyWeekTimestamp = 24192000

    var body: some View {
        ZStack {
            VStack {
                DatePicker(selection: $satDate, in: ...Date(), displayedComponents: .date) {
                    HStack {
                        Text(Constants.selectSAT).foregroundColor(.primary).bold().font(.title2)
                    }
                }.padding()
                Spacer()
                Text(Constants.probableDateOfBirth).font(.title2)
                Text("\(Date(timeIntervalSince1970: TimeInterval(estimatedBirthDate)).formatted(.dateTime.day().month(.wide).year()))")
                    .bold().font(.title)
                Spacer()

                NavigationLink(destination: DetailEstimatedDateOfBirthScene(satDate: $satDate)) {
                    HStack {
                        Spacer()
                        Text(Constants.forMore).foregroundColor(.white)
                        Image(systemName: "chevron.right").foregroundColor(.white)
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

struct EstimatedBirthView_Previews: PreviewProvider {
    static var previews: some View {
        EstimatedBirthView()
    }
}
