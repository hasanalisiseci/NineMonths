//
//  SearchBar.swift
//  NineMonths
//
//  Created by Hasan Ali Şişeci on 15.10.2022.
//

import SwiftUI

struct SearchBar: View {
    @Binding var name: String

    var body: some View {
        TextField(Constants.enterLetter, text: $name)
            .textFieldStyle(
                GradientTextFieldBackground(
                    systemImageString: "character.book.closed.fill")
            ).padding()
    }
}

struct GradientTextFieldBackground: TextFieldStyle {
    let systemImageString: String
    func _body(configuration: TextField<Self._Label>) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5.0)
                .stroke(
                    LinearGradient(
                        colors: [
                            .pink,
                            .pink,
                            .blue,
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                ).frame(height: 40)
            HStack {
                Image(systemName: systemImageString)
                // Reference the TextField here
                configuration
            }
            .padding(.leading)
            .foregroundColor(.gray)
        }
    }
}
