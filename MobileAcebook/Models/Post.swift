//
//  Post.swift
//  MobileAcebook
//
//  Created by Reza Jugon on 03/09/2024.
//

import Foundation


// Model for a single Post
struct Post: Codable, Identifiable {
    let id = UUID()
    var title: String
    var comment: String
    var likes: Int
}
