//
//  MainView.swift
//  ListViewSwiftUI
//
//  Created by Zülfü Akgüneş on 5.02.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var authViewModel = AuthViewModel()
    
    var body: some View {
        if authViewModel.isAuthenticated {
            TabView {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                AddWordView()
                    .tabItem {
                        Label("Add", systemImage: "book.fill")
                    }
                PhotosView()
                    .tabItem {
                        Label("Photos", systemImage: "photo")
                    }
            }
        } else {
            SignUpView().environmentObject(authViewModel)
        }
        
        
        
    }
}
