//
//  DetailView.swift
//  ListViewSwiftUI
//
//  Created by Zülfü Akgüneş on 4.02.2024.
//

import SwiftUI

struct DetailView: View {
    let post: Posts
    @StateObject var viewModel = DetailViewModel()
    
    var body: some View {
        VStack {
            Text(post.title)
            Text(post.body)
        }
        .onAppear {
            viewModel.fetchPosts()
        }
    }
}
