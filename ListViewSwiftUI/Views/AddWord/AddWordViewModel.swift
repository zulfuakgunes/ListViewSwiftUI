//
//  AddWordViewModel.swift
//  ListViewSwiftUI
//
//  Created by Zülfü Akgüneş on 10.02.2024.
//

import Foundation
import Firebase

class AddWordViewModel: ObservableObject {
    func addData(text: String) {
        let db = Firestore.firestore()
        db.collection("wprd").addDocument(data: ["textField": text]) { error in
            if let error = error {
                print("Error adding document: \(error)")
            } else {
                print("Document added successfully")
            }
        }
    }
}
