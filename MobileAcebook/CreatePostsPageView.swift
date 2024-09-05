import SwiftUI
import UIKit


// The main view
struct CreatePostsPageView: View {
    @State private var postMessage = ""
    @State private var selectedImage: UIImage? = nil
    @State private var isImagePickerPresented = false
    
    var body: some View {
        VStack(alignment: .center) {
            // Display the selected image, or a button to select one
            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding()
            } else {
                Button(action: {
                    isImagePickerPresented = true
                }) {
                    TextField("What's on your mind...", text: $postMessage)
                        .padding()
//                        .frame(width:100, height:100)
                        .scrollContentBackground(.hidden)
                }
                .padding()
            }

            Form {
                Section {
//                    TextField("What's on your mind.", text: $postMessage)
                    Text("Select an Image")
                        .foregroundColor(.blue)
                }
                Button("Submit") {
                    // Action for the button
                    
                }
                
            }
            CustomNavigationBar()
        }
        .padding()
        .sheet(isPresented: $isImagePickerPresented) {
            ImagePicker(image: $selectedImage)
        }
        .navigationBarBackButtonHidden(true)
        
    }
}

// Preview
struct CreatePostsPageView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePostsPageView()
    }
}
