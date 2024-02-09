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
                PhotosView()
                    .tabItem {
                        Label("Photos", systemImage: "magnifyingglass")
                    }
            }
        } else {
            SignUpView().environmentObject(authViewModel)
        }
        
        
        
    }
}
