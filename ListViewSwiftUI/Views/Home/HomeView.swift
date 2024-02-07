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

    var filteredItems: [Posts] {
        guard !searchText.isEmpty else {
            return viewModel.posts
        }
        return viewModel.posts.filter({$0.title.localizedCaseInsensitiveContains(searchText)})
    }
    

    var body: some View {
        NavigationView(content: {
                List(filteredItems, id: \.title) { post in
                    NavigationLink(destination: DetailView(viewModel: DetailViewModel(postId: post.id))){
                    Text(post.title)
                    
                }
            }
        })
        .searchable(text: $searchText, prompt: "Ara")
        .onChange(of: searchText,
                  { oldValue, newValue in
        })
        .onAppear {
            viewModel.fetchPosts()
        }
    }
}

#Preview {
    HomeView()
}
