//
//  SignInView.swift
//  ListViewSwiftUI
//
//  Created by Zülfü Akgüneş on 8.02.2024.
//

import SwiftUI
import Firebase

struct SignInView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String?

    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            }
            Button("Sign In") {
                signIn()
            }
            .padding()
        }
        .padding()
    }

    func signIn() {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
            } else {
                self.errorMessage = nil
            }
        }
    }
}

