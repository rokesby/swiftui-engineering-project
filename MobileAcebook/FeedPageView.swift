import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = PostViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Logo at the top of the feed
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 130) // Adjust size as needed
                    .padding(.top, -30.0) // Add some space at the top
                
                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(viewModel.posts) { post in
                            PostView(post: post)
                                .environmentObject(viewModel)
                                .background(Color.black) // Ensure each post has a black background
                                .cornerRadius(10)
                                .padding(.horizontal) // Add some padding to separate posts from edges
                        }
                    }
                }

                CustomNavigationBar()
                    .padding(.bottom, -30.0) // Add custom navigation bar at the bottom
            }
            .background(Color.black.edgesIgnoringSafeArea(.all)) // Set the entire background to black
            .navigationBarHidden(true) // Hide the default navigation bar
        }
        .navigationBarBackButtonHidden(true)
    }
}

// View for a single post
struct PostView: View {
    @EnvironmentObject var viewModel: PostViewModel
    @State private var newComment: String = ""
    var post: Post
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(post.message)
                .font(.headline)
                .foregroundColor(.white) // Set text color to white for better visibility on black background
            
            Text(post.comment)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            if !post.imageUrl.isEmpty {
                Text(post.imageUrl)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
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
                    .foregroundColor(.gray) // Button color
                }
                
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
        .background(Color.gray.opacity(0.2)) // Light background for post container
        .cornerRadius(10)
    }
}



// Previews
struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
