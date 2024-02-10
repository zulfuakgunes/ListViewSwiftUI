//
//  AddWordView.swift
//  ListViewSwiftUI
//
//  Created by Zülfü Akgüneş on 10.02.2024.
//

import SwiftUI

struct AddWordView: View {
    @State private var textFieldData = ""
    @ObservedObject private var viewModel = FirestoreViewModel()

    var body: some View {
        VStack {
            TextField("Enter text here", text: $textFieldData)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Save to word") {
                viewModel.addData(text: textFieldData)
            }
            .padding()
        }
    }
}
