//
//  EstimatedBirthView.swift
//  NineMonths
//
//  Created by Hasan Ali Şişeci on 15.10.2022.
//

import SwiftUI

struct EstimatedBirthView: View {
    @State private var birthDate = Date()

    var body: some View {
        ZStack {
            VStack {
                DatePicker(selection: $birthDate, in: ...Date(), displayedComponents: .date) {
                    HStack {
                        Spacer()
                        Text("Select a date").foregroundColor(.primary).bold().font(.title2)
                    }
                }.padding()
                Spacer()
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
