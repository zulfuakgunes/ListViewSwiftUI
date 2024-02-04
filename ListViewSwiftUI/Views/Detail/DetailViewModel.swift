//
//  DetailViewModel.swift
//  ListViewSwiftUI
//
//  Created by Zülfü Akgüneş on 4.02.2024.
//

import Foundation

class DetailViewModel: ObservableObject {
    let postId: Int
    @Published var postDetail: Posts? = nil
//    @Published var posts = [Posts]()
    
    init(postId: Int) {
        self.postId = postId
    }
    
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
                self.postDetail = decodingPosts.first(where: {$0.id == self.postId})
            }catch {
                print("Error \(error)")
            }
            
        }.resume()
    }
}
