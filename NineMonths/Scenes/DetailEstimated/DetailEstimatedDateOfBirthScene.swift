//
//  DetailEstimatedDateOfBirth.swift
//  NineMonths
//
//  Created by Hasan Ali Şişeci on 15.10.2022.
//

import SwiftUI

struct DetailEstimatedDateOfBirthScene: View {
    @Binding var satDate: Date
    private var estimatedBirthDate: Int {
        return Int(satDate.timeIntervalSince1970) + fourtyWeeks
    }

    private var estimatedConceptionDate: Int {
        return Int(satDate.timeIntervalSince1970) + twoWeeks
    }

    private var fetalWeek: Int {
        var temp = Int(Date().timeIntervalSince1970 - satDate.timeIntervalSince1970)
        return temp / 604800
    }

    private var fetalDay: Int {
        var temp = Int(Date().timeIntervalSince1970 - satDate.timeIntervalSince1970)
        var day = (temp / 86400) % 7
        return day
    }

    private let formatted = Date().formatted(.dateTime.day().month(.wide).year())
    private let fourtyWeeks = 24192000
    private let twoWeeks = 1209600
    private let sevenWeeks = 5443200
    private let eightWeeks = 6048000

    var body: some View {
        NavigationView {
            List {
                DatePicker(selection: $satDate, in: ...Date(), displayedComponents: .date) {
                    Text(Constants.selectSAT).foregroundColor(.primary).bold().font(.title2)
                }

                VStack(alignment: .leading) {
                    Text(Constants.probableDateOfConception).font(.title2)
                    Text("\(Date(timeIntervalSince1970: TimeInterval(estimatedConceptionDate)).formatted(.dateTime.day().month(.wide).year()))")
                        .bold().font(.title2).foregroundColor(.accentColor)
                }
                VStack(alignment: .leading) {
                    Text(Constants.fetalAge).font(.title2)
                    Text("\(fetalWeek != 0 ? "\(fetalWeek) " : "")\(fetalWeek != 0 ? "\(Constants.week) " : "")\(fetalDay) \(Constants.day)")
                        .bold().font(.title2).foregroundColor(.accentColor)
                }
                VStack(alignment: .leading) {
                    Text(Constants.probableDateOfBirth).font(.title2)
                    Text("\(Date(timeIntervalSince1970: TimeInterval(estimatedBirthDate)).formatted(.dateTime.day().month(.wide).year()))")
                        .bold().font(.title2).foregroundColor(.accentColor)
                }
                VStack(alignment: .leading) {
                    Text(Constants.hearbeat).font(.title2)
                    Text("\(Date(timeIntervalSince1970: TimeInterval(estimatedConceptionDate + sevenWeeks)).formatted(.dateTime.day().month(.wide).year())) - \(Date(timeIntervalSince1970: TimeInterval(estimatedConceptionDate + eightWeeks)).formatted(.dateTime.day().month(.wide).year()))")
                        .bold().font(.title3).foregroundColor(.accentColor)
                }
            }
        }
        .navigationTitle(Constants.probableDateOfBirth)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailEstimatedDateOfBirthScene_Previews: PreviewProvider {
    static var previews: some View {
        DetailEstimatedDateOfBirthScene(satDate: .constant(Date()))
    }
}

extension Date {
}
