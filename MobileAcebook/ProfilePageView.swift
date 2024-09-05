import SwiftUI

struct ProfilePageView: View {
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack {
                        VStack {
                            Image("profilePicture") // Replace with your actual image name
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
                            // Image Post
                            ImagePostView(imageName: "post1", caption: "Had a great time hiking!")
                            
                            // Text-Only Post
                            TextPostView(text: "Enjoying a quiet evening with a good book. Highly recommend 'The Midnight Library'!")
                            
                            // Another Image Post
                            ImagePostView(imageName: "post2", caption: "Loving the new cafe in town!")
                            
                            // Another Text-Only Post
                            TextPostView(text: "Excited for the weekend! Anyone up for a road trip?")
                        }
                        .padding([.leading, .trailing])
                    }
                }
                CustomNavigationBar()
                
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
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxHeight: 300)
                .cornerRadius(10)
            
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
