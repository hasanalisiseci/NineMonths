//
//  NamesViewModel.swift
//  NineMonths
//
//  Created by Hasan Ali Şişeci on 15.10.2022.
//

import Foundation

class NamesViewModel: NSObject, ObservableObject {
    @Published var namesArray: [NameModel] = []

    override init() {
        super.init()
        print("init çalışıyor")
        getNames()
    }

    func getNames() {
        NetworkManager.shared.getNames { [weak self] result in
            guard let self = self else { return }

            switch result {
            case let .success(names):
                self.namesArray = names
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
}
