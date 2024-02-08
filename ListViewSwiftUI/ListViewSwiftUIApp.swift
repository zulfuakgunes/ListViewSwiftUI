//
//  ListViewSwiftUIApp.swift
//  ListViewSwiftUI
//
//  Created by Zülfü Akgüneş on 4.02.2024.
//

import SwiftUI
import Firebase

@main
struct ListViewSwiftUIApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
