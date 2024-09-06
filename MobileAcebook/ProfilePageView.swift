import SwiftUI

struct ProfilePageView: View {
    // Hardcoded posts
    let posts = [
        Post(message: "Had a great day at the beach!", comment: "Looks amazing!", likes: 120, imageUrl: "https://via.placeholder.com/300", createdAt: "2024-09-03"),
        Post(message: "Just had an amazing lunch! 🍔", comment: "Yummy!", likes: 75, imageUrl: "", createdAt: "2024-09-04"),
        Post(message: "Check out this cool sunset! 🌅", comment: "Beautiful view!", likes: 200, imageUrl: "https://via.placeholder.com/300", createdAt: "2024-09-01"),
        Post(message: "Feeling productive today!", comment: "Good for you!", likes: 50, imageUrl: "", createdAt: "2024-09-05")
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack {
                        VStack {
                            Image("Sunset") // Hardcoded profile picture, replace with actual image name or URL
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 150, height: 150)
                                .clipShape(Circle())
                                .overlay(
                                    Circle().stroke(Color.white, lineWidth: 4)
                                )
                                .shadow(radius: 10)
                            
                            Text("John King")
                                .font(.title)
                                .foregroundColor(.white)
                                .padding(.top, 8)
                        }
                        .padding()

                        VStack(spacing: 10) {
                            ForEach(posts) { post in
                                if !post.imageUrl.isEmpty {
                                    ImagePostView(imageName: post.imageUrl, caption: post.message)
                                } else {
                                    TextPostView(text: post.message)
                                }
                            }
                        }
                        .padding([.leading, .trailing])
                    }
                }
                CustomNavigationBar()
                    .padding(.bottom, -30.0)
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
            .navigationBarHidden(true) // Hides the default navigation bar
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ImagePostView: View {
    var imageName: String
    var caption: String

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            AsyncImage(url: URL(string: imageName)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxHeight: 300)
                    .cornerRadius(10)
            } placeholder: {
                ProgressView()
                    .frame(maxHeight: 300)
            }

            Text(caption)
                .font(.body)
                .foregroundColor(.white)
                .padding([.leading, .trailing])

            HStack {
                Button(action: {
                    // Like action
                }) {
                    Text("Like")
                        .foregroundColor(.gray)
                }
                Spacer()
                Button(action: {
                    // Comment action
                }) {
                    Text("Comment")
                        .foregroundColor(.gray)
                }
                Spacer()
                Button(action: {
                    // Share action
                }) {
                    Text("Share")
                        .foregroundColor(.gray)
                }
            }
            .padding([.leading, .trailing, .bottom])
        }
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}

struct TextPostView: View {
    var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(text)
                .font(.body)
                .foregroundColor(.white)
                .padding([.leading, .trailing, .top])
            
            HStack {
                Button(action: {
                    // Like action
                }) {
                    Text("Like")
                        .foregroundColor(.gray)
                }
                Spacer()
                Button(action: {
                    // Comment action
                }) {
                    Text("Comment")
                        .foregroundColor(.gray)
                }
                Spacer()
                Button(action: {
                    // Share action
                }) {
                    Text("Share")
                        .foregroundColor(.gray)
                }
            }
            .padding([.leading, .trailing, .bottom])
        }
        
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}

struct ProfilePageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePageView()
    }
}
