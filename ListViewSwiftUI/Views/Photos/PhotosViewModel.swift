//
//  PhotosViewModel.swift
//  ListViewSwiftUI
//
//  Created by Zülfü Akgüneş on 5.02.2024.
//

import Foundation

class PhotosViewModel: ObservableObject {
    @Published var photos: [Photos] = []
    
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
                let decodingPosts = try JSONDecoder().decode([Photos].self, from: data)
                DispatchQueue.main.async {
                    self.photos = decodingPosts
                }

            }catch {
                print("Error \(error)")
            }
            
        }.resume()
    }
}
