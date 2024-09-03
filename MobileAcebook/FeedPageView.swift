//
//  FeedPageView.swift
//  MobileAcebook
//
//  Created by Santosh Dasari on 02/09/2024.
//

import Foundation

// Mock up a simple posting
// Make a call to the Acebook API to retreive a posting
// Loop through and render each posting

import SwiftUI


// View Model to manage the list of posts
class PostViewModel: ObservableObject {

    @Published var posts: [Post] = [
        Post(title: "This is my first post", comment: "This is a comment on post 1", likes: 0),
        Post(title: "This is my second post", comment: "This is a comment on post 2", likes: 0),
        Post(title: "This is my third post", comment: "This is a comment on post 3", likes: 0)
    ]
    
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

// Main View
struct ContentView: View {
    @StateObject private var viewModel = PostViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.posts) { post in
                    PostView(post: post)
                        .environmentObject(viewModel)
                }
            }
            .navigationTitle("Postings")
        }
    }
}

// View for a single post
struct PostView: View {
    @EnvironmentObject var viewModel: PostViewModel
    @State private var newComment: String = ""
    var post: Post
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(post.title)
                .font(.headline)
            
            Text(post.comment)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            HStack {
                Button(action: {
                    viewModel.likePost(post)
                }) {
                    HStack {
                        Image(systemName: "hand.thumbsup")
                        Text("\(post.likes) Likes")
                    }
                }
                .buttonStyle(BorderlessButtonStyle())
                
                Spacer()
            }
            .padding(.top, 5)
            
            TextField("Add a comment...", text: $newComment, onCommit: {
                viewModel.addComment(post, newComment: newComment)
                newComment = ""
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.top, 5)
        }
        .padding()
    }
}

/*@main
struct PostingsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}*/

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
