import SwiftUI
import UIKit

struct CreatePostsPageView: View {
    @State private var postMessage = ""
    @State private var selectedImage: UIImage? = nil
    @State private var isImagePickerPresented = false
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                // Display the selected image, or a button to select one
                if let image = selectedImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .padding()
                }
                
                // TextField for the post message
                TextField("What's on your mind...", text: $postMessage)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                // Form with buttons
                Form {
                    Button("Select an Image") {
                        isImagePickerPresented = true
                    }
                    
                    // Submit button that calls createPost()
                    Button("Submit") {
                        createPost()
                    }
                }
                .frame(width: 300, height: 150)
            }
            .padding()
            .sheet(isPresented: $isImagePickerPresented) {
                ImagePicker(image: $selectedImage)
            }
            .navigationBarBackButtonHidden(false)
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Post Creation"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    // CreatePost function modified to work with current ViewState
    private func createPost() {
        // Ensure required fields are filled out; adjust validation as needed.
        guard !postMessage.isEmpty else {
            alertMessage = "Message cannot be empty."
            showAlert = true
            return
        }
        
        var imgBase64String = ""

        // Check if selectedImage is nil and generate the base64 string
        if let imageData = selectedImage?.jpegData(compressionQuality: 0.01) {
            imgBase64String = imageData.base64EncodedString()
            print("Image base64 string generated successfully")
        } else {
            print("Image was not generated successfully")
        }
        
        // Creating post object based on API requirements
        let postContent: [String: Any] = [
            "message": postMessage,
            "createdAt": Date().timeIntervalSince1970,
            "createdBy": "userId", // Replace this with your actual user's ID or fetch it as needed
            "imgUrl": imgBase64String.isEmpty ? nil : imgBase64String ?? ""
        ]
        
        // Call your post creation service
        PostServiceClass().createPost(postContent: postContent) { response, error in
            DispatchQueue.main.async {
                if let error = error {
                    alertMessage = "Post creation error: \(error.localizedDescription)"
                    showAlert = true
                } else if let response = response {
                    alertMessage = "Post created successfully: \(response)"
                    showAlert = true
                    // Additional state updates if needed
                    // e.g., clear form fields or navigate to another view
                }
            }
        }
    }
}



struct CreatePostsPageView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePostsPageView()
    }
}
