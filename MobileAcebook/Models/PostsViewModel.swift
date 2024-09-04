//
//  PostsViewModel.swift
//  MobileAcebook
//
//  Created by Reza Jugon on 03/09/2024.
//

import Foundation

class PostViewModel: ObservableObject {
        
    @Published var posts: [Post] = [
        Post(message: "This is my first post", comment: "This is a comment on post 1", likes: 0, imageUrl: "placeholder img url 1", createdAt: "2024-09-03"),
        Post(message: "This is my second post", comment: "This is a comment on post 2", likes: 0, imageUrl: "placeholder img url 2", createdAt: "2024-09-04"),
        Post(message: "This is my third post", comment: "This is a comment on post 3", likes: 0, imageUrl: "placeholder img url 3", createdAt: "2024-09-05")
    ]
    
    @Published var posts2: [Post] = []
    func fetchPosts() {

        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }

            let posts2 = try? JSONDecoder().decode([Post].self, from: data)
            DispatchQueue.main.async {
                self.posts2 = posts2 ?? []
            }
            print("=> fetch posts2")
            //print(posts2)

        }.resume()
        
    }
    
    func printPosts() {
        // Loop through the array and print each Post's properties
        for post in posts {
            print("Post ID: \(post.id)")
            print("Message: \(post.message)")
            print("Comment: \(post.comment)")
            print("Likes: \(post.likes)")
            print("Image URL: \(post.imageUrl)")
            print("Created At: \(post.createdAt)")
            print("-----") // Separator between posts
        }
    }
    
    func likePost(_ post: Post) {
        if let index = posts.firstIndex(where: { $0.id == post.id }) {
            posts[index].likes += 1
        }
    }
    
    func addComment(_ post: Post, newComment: String) {
        if let index = posts.firstIndex(where: { $0.id == post.id }) {
            posts[index].comment = newComment
        }
    }
}

// -----------------------------------------------------------------------------------------------


//// View Model to manage the list of posts
//class PostViewModel: ObservableObject {
//
//    @Published var posts: [Post] = [
//        Post(title: "This is my first post", comment: "This is a comment on post 1", likes: 0),
//        Post(title: "This is my second post", comment: "This is a comment on post 2", likes: 0),
//        Post(title: "This is my third post", comment: "This is a comment on post 3", likes: 0)
//    ]
//    
//    func likePost(_ post: Post) {
//        if let index = posts.firstIndex(where: { $0.id == post.id }) {
//            posts[index].likes += 1
//        }
//    }
//    
//    func addComment(_ post: Post, newComment: String) {
//        if let index = posts.firstIndex(where: { $0.id == post.id }) {
//            posts[index].comment = newComment
//        }
//    }
//}
