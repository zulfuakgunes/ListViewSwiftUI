//
//  PhotosDetailViewModel.swift
//  ListViewSwiftUI
//
//  Created by Zülfü Akgüneş on 5.02.2024.
//

import Foundation

class PhotosDetailViewModel: ObservableObject {
    let photosId: Int
    @Published var photosDetail: Photos? = nil
    
    init(photosId: Int) {
        self.photosId = photosId
    }
    
    func fetchPhotos() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error {
                print(error.localizedDescription)
            }
            
            guard let data else {
                return
            }
            
            do {
                let decode = try JSONDecoder().decode([Photos].self, from: data)
                self.photosDetail = decode.first(where: {$0.id == self.photosId})
            } catch {
                print(error)
            }
            
        }.resume()
        
    }
}
