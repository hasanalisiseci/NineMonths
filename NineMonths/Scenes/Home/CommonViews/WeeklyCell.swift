//
//  WeeklyCell.swift
//  NineMonths
//
//  Created by Hasan Ali Şişeci on 15.10.2022.
//

import Kingfisher
import SwiftUI

struct WeeklyCell: View {
    var model: WeekByWeek
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(.pink)
            VStack {
                HStack {
                    Text(model.title).bold().font(.title).foregroundColor(.white)
                    Spacer()
                }.padding()
                HStack {
                    KFImage(URL(string: model.imageURL))
                        .resizable()
                        .placeholder({ _ in
                            ProgressView()
                        })
                        .cornerRadius(12)
                        .frame(width: UIScreen.screenWidth * 0.4, height: UIScreen.screenWidth * 0.3)
                    Text(model.description).multilineTextAlignment(.leading)

                        .padding(.vertical)
                        .padding(.trailing)
                        .foregroundColor(.white)
                }.padding()
            }
        }
        .frame(width: UIScreen.screenWidth - 20, height: UIScreen.screenHeight * 0.25)
        .cornerRadius(12)
    }
}

struct WeeklyCell_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyCell(model: WeekByWeek(title: "Gebelikte 1. Hafta", week: 1, description: "Akciğerlerindeki gelişim tamamlanan bebekler, gebeliğin 9. ayında doğuma tamamen hazırdırlar. Doğduğu andan itibaren vücut ısısını korumasına yardımcı olacak yağ tabakası gelişimini tamamlarken kilo alımı ve irileşme de maksimum seviyeye ulaşır. Kısacası 9 aylık gebelik dönemiyle birlikte bebeğinizin sesini ilk kez duymaya ve minik elleriyle parmaklarınızı sıkmasına çok az kaldı.", imageURL: "https://firebasestorage.googleapis.com/v0/b/ninemonths-1354.appspot.com/o/embryoWeekByWeek%2F30-haftalik-hamilelik.jpeg?alt=media&token=3cf55568-38de-4abb-a648-7782a9a305ec"))
    }
}
