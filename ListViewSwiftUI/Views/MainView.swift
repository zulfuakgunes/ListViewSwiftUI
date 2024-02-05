//
//  MainView.swift
//  ListViewSwiftUI
//
//  Created by Zülfü Akgüneş on 5.02.2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
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
    }
}
