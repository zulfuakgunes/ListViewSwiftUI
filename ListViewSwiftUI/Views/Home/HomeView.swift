//
//  HomeView.swift
//  ListViewSwiftUI
//
//  Created by Zülfü Akgüneş on 4.02.2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    @State var searchText = ""
    var body: some View {
        NavigationView(content: {
            
                List(viewModel.posts, id: \.title) { post in
                    NavigationLink(destination: DetailView(viewModel: DetailViewModel(postId: post.id))){
                    Text(post.title)
                    
                }
            }
        })
        .searchable(text: $searchText, prompt: "Ara")
        .onAppear {
            viewModel.fetchPosts()
        }
    }
}

#Preview {
    HomeView()
}
