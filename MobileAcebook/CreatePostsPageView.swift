import SwiftUI
import UIKit

// The main view
struct CreatePostsPageView: View {
    @State private var postMessage = ""
    @State private var selectedImage: UIImage? = nil
    @State private var isImagePickerPresented = false
    @State private var isLogin = true
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                    VStack(alignment: .center) {
                        Image("Logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .accessibilityIdentifier("Acebook-Logo")
                        Form {
                        // Display the selected image, or a button to select one
                        if let image = selectedImage {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 200)
                                .padding()
                        } else {
                            Button(action: {
                            }) {
                                TextField("What's on your mind...", text: $postMessage)
//                                    .scrollContentBackground(.hidden)
//                                    .sizeToFit()
//                                    .multilineTextAlignment(.leading)
                                    .frame(width: 300.0, height: 150.0)
                                    .padding()
                            }
                            .padding([.leading, .trailing, .bottom])
                        }
                            Button ("selected an Image", action:{
                                
                                isImagePickerPresented = true
                            })
                            NavigationLink(destination: ContentView()) {
                                Text("Submit")
                            }
                            
                        }
                        CustomNavigationBar()
                        
                        .background(Color.gray.opacity(0.2))
                        .edgesIgnoringSafeArea(.all)

                    }
                    .scrollContentBackground(.hidden)
//                    .ignoresSafeArea()
                    .edgesIgnoringSafeArea(.all)
                    .sheet(isPresented: $isImagePickerPresented) {
                        ImagePicker(image: $selectedImage)
                    }
                }
                .navigationBarBackButtonHidden(true)
            }
        }
        
    }



//class PostService {
//    static let shared = PostService()
//    
//    let baseURL = "https://your-backend-url.com/api" // Replace with your actual backend URL
//
//    func createPost(post: Post, completion: @escaping (Result<Post, Error>) -> Void) {
//        guard let url = URL(string: "\(baseURL)/posts") else { return }
//        
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        
//        do {
//            let jsonData = try JSONEncoder().encode(post)
//            request.httpBody = jsonData
//            
//            let task = URLSession.shared.dataTask(with: request) { data, response, error in
//                if let error = error {
//                    completion(.failure(error))
//                    return
//                }
//                
//                guard let data = data else { return }
//                
//                do {
//                    let createdPost = try JSONDecoder().decode(Post.self, from: data)
//                    completion(.success(createdPost))
//                } catch {
//                    completion(.failure(error))
//                }
//            }
//            task.resume()
//        } catch {
//            completion(.failure(error))
//        }
//    }
//}


// Preview
struct CreatePostsPageView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePostsPageView()
    }
}
