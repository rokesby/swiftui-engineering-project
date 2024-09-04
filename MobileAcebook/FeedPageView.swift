//  FeedPageView.swift
//  MobileAcebook

import Foundation
import SwiftUI

// Mock up a simple posting
// Make a call to the Acebook API to retreive a posting
// Loop through and render each posting


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
            Text(post.message)
                .font(.headline)
            
            Text(post.comment)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text(post.imageUrl)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text(post.createdAt)
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
        .onAppear{
            viewModel.fetchPosts()
            viewModel.printPosts()
        }
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
