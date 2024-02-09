//
//  SignUpView.swift
//  ListViewSwiftUI
//
//  Created by Zülfü Akgüneş on 9.02.2024.
//

import SwiftUI

struct SignUpView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button("Kayıt Ol") {
                authViewModel.signUp(email: email, password: password)
            }
            .padding()
        }
        .padding()
    }
}

