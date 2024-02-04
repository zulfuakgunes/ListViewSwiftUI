//
//  DetailView.swift
//  ListViewSwiftUI
//
//  Created by Zülfü Akgüneş on 4.02.2024.
//

import SwiftUI

struct DetailView: View {
    @StateObject var viewModel: DetailViewModel
    
    var body: some View {
        VStack {
            if let postDetail = viewModel.postDetail {
                Text(postDetail.title)
                Text(postDetail.body)
            }
        }
        .onAppear {
            viewModel.fetchPosts()
        }
    }
}
