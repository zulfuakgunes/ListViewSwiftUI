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
                ZStack {
                    RoundedRectangle(cornerRadius: 10) // Kartın arka planı
                        .fill(Color.white) // Arka plan rengi
                        .shadow(radius: 5) // Arka plana gölge ekler
                    
                    Text(postDetail.title)
                    }
                .padding()
                .frame(width: 400, height: 200)
                Text(postDetail.body)
                Spacer()
            }
        }
        .onAppear {
            viewModel.fetchPosts()
        }
    }
}
