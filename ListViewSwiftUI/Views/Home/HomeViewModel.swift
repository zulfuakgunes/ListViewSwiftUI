//
//  HomeViewModel.swift
//  ListViewSwiftUI
//
//  Created by Zülfü Akgüneş on 4.02.2024.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var posts = [Posts]()
    @Published var filteredPosts = [Posts]()
    
    func fetchPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
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
                let decodingPosts = try JSONDecoder().decode([Posts].self, from: data)
                DispatchQueue.main.async {
                    self.posts = decodingPosts
                }
            }catch {
                print("Error \(error)")
            }
            
            
        }.resume()
    }
}
