//
//  PhotosView.swift
//  ListViewSwiftUI
//
//  Created by Zülfü Akgüneş on 5.02.2024.
//

import SwiftUI

struct PhotosView: View {
    @StateObject var viewModel = PhotosViewModel()
    
    var body: some View {
        NavigationView(content: {
            List(viewModel.photos, id: \.id) { photo in
                NavigationLink(destination: PhotosDetailView(viewModel: PhotosDetailViewModel(photosId: photo.id))) {
                    HStack {
                        AsyncImage(url: URL(string: photo.thumbnailUrl)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 50, height: 50)
                        .aspectRatio(contentMode: .fit)
                        Text(photo.title)
                    }
                }
            }
            
        })
        .onAppear {
            viewModel.fetchPhotos()
        }
    }
}

#Preview {
    PhotosView()
}
