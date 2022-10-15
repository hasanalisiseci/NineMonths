//
//  Service.swift
//  NineMonths
//
//  Created by Hasan Ali Şişeci on 15.10.2022.
//

import FirebaseFirestore
import FirebaseFirestoreSwift
import Foundation

class FirestoreManager<T: Codable>: NSObject, Codable {
    public func get(by order: String, onCompletion: @escaping ([T?]?, Error?) -> Void) {
        let typeNameStr = String(describing: T.self)
        let db = Firestore.firestore()
        let collectionRef = db.collection(typeNameStr).order(by: order, descending: false)
        var docs: [T] = []

        collectionRef.getDocuments { query, error in
            if let error = error {
                onCompletion(nil, error)
            } else {
                for document in query!.documents {
                    print("\(document.documentID) => \(document.data())")
                    let doc = document as QueryDocumentSnapshot?
                    let result = Result {
                        try doc.flatMap {
                            try $0.data(as: T.self)
                        }
                    }
                    if let error = error {
                        print(error)
                    }
                    switch result {
                    case let .success(uploadDocument):
                        if let uploadDocument = uploadDocument {
                            docs.append(uploadDocument)
                        } else {}
                    case let .failure(error):
                        print("Error decoding Document \(error)")
                        onCompletion(nil, error)
                    }
                }
                onCompletion(docs, nil)
            }
        }
    }
}
