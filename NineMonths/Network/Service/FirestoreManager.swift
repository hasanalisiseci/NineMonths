//
//  Service.swift
//  NineMonths
//
//  Created by Hasan Ali Şişeci on 15.10.2022.
//

import FirebaseFirestore
import FirebaseFirestoreSwift
import Foundation

class FirestoreManager {
    static let shared = FirestoreManager()
    let db = Firestore.firestore()

    func getDocuments(collectionName: String, by order: String, completed: @escaping (Result<[MonthByMonthModel], ErrorTypes>) -> Void) {
        let collectionRef = db.collection(collectionName).order(by: order, descending: false)

        collectionRef.getDocuments { snapshot, error in
            if let error = error {
                print("Error getting stories: \(error.localizedDescription)")
                completed(.failure(error as! ErrorTypes))
                return
            }
            let result = snapshot?.documents.compactMap { document in
                try? document.data(as: MonthByMonthModel.self)
            } ?? []

            completed(.success(result))
        }
    }
}
