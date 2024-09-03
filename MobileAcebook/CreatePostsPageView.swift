import SwiftUI
import UIKit

// The ImagePicker struct
struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) private var presentationMode

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.selectedImage = uiImage
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}

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
                    TextField("1What's on your mind...", text: $postMessage)
                        .padding()
                        .scrollContentBackground(.hidden)
                }
                .padding()
            }
            
//            Text("Hello, \(postMessage)")
//                .padding()
            
            Spacer()

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
        }
        .padding()
        .sheet(isPresented: $isImagePickerPresented) {
            ImagePicker(selectedImage: $selectedImage)
        }
    }
}

// Preview
struct CreatePostsPageView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePostsPageView()
    }
}
