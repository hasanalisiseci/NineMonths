//
//  RoundedButtonView.swift
//  NineMonths
//
//  Created by Hasan Ali Şişeci on 15.10.2022.
//

import Kingfisher
import SwiftUI

struct RoundedButtonView: View {
    let imageURL: String
    let title: String
    var body: some View {
        ZStack {
            KFImage(URL(string: imageURL))
                .resizable()
                .placeholder({ _ in
                    ProgressView()
                })
                .frame(width: UIScreen.screenWidth - 20, height: 150)
                .cornerRadius(12)
            RoundedRectangle(cornerRadius: 12).frame(width: UIScreen.screenWidth - 20, height: 150).foregroundColor(.pink).opacity(0.5)
            Text(title).bold().font(.title).multilineTextAlignment(.leading).foregroundColor(.white)
        }.padding(.vertical)
    }
}

struct RoundedButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RoundedButtonView(imageURL: "", title: "")
    }
}
