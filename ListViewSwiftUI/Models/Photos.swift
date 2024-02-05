//
//  Photos.swift
//  ListViewSwiftUI
//
//  Created by Zülfü Akgüneş on 5.02.2024.
//

import Foundation

struct Photos: Codable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
