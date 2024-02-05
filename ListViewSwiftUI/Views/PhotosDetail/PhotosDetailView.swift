//
//  PhotosDetailView.swift
//  ListViewSwiftUI
//
//  Created by Zülfü Akgüneş on 5.02.2024.
//

import SwiftUI

struct PhotosDetailView: View {
    @StateObject var viewModel: PhotosDetailViewModel
    
    var body: some View {
        
        VStack {
            if let photosDetail = viewModel.photosDetail{
                AsyncImage(url: URL(string: photosDetail.url)) { photo in
                    photo.resizable()
                } placeholder: {
                    ProgressView()
                }
                Text(photosDetail.title)
            }
        }.onAppear(perform: {
            viewModel.fetchPhotos()
        })
    }
}

#Preview {
    PhotosDetailView(viewModel: PhotosDetailViewModel(photosId: 2))
}
