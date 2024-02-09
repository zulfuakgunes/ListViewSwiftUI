//
//  AuthViewModel.swift
//  ListViewSwiftUI
//
//  Created by Zülfü Akgüneş on 9.02.2024.
//

import Foundation
import Firebase

class AuthViewModel: ObservableObject {
    @Published var isAuthenticated = false

    func signUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                // Kayıt başarılı, kullanıcıyı giriş yapmış olarak işaretle
                self.isAuthenticated = true
            }
        }
    }

    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                // Giriş başarılı, kullanıcıyı giriş yapmış olarak işaretle
                self.isAuthenticated = true
            }
        }
    }
}
