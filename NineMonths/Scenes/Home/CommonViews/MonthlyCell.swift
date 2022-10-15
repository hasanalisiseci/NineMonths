//
//  MonthCell.swift
//  NineMonths
//
//  Created by Hasan Ali Şişeci on 15.10.2022.
//

import Kingfisher
import SwiftUI

struct MonthlyCell: View {
    var number: Int
    var photoUrl: String
    var body: some View {
        ZStack {
            KFImage(URL(string: photoUrl))
                .resizable()
                .placeholder({ _ in
                    ProgressView()
                })
                .frame(width: UIScreen.screenWidth * 0.3, height: UIScreen.screenWidth * 0.3)
            RoundedRectangle(cornerRadius: 12)
                .frame(width: UIScreen.screenWidth * 0.3, height: UIScreen.screenWidth * 0.3).foregroundColor(.red)
                .foregroundColor(.red).opacity(0.3)
            VStack {
                HStack {
                    Text(number.toStr)
                        .bold()
                        .font(.title)
                        .padding(.leading)
                        .padding(.top, 5)
                        .foregroundColor(.red)
                    Spacer()
                }
                Spacer()
            }
        }
    }
}
