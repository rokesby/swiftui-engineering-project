//
//  SignUpPageView.swift
//  MobileAcebook
//
//  Created by Santosh Dasari on 02/09/2024.
//

//
//struct SignUpPageView: View {
//    
//    @State private var username = ""
//    @State private var email = ""
//    @State private var password = ""
//    @State private var confirmed_password = ""
//    
////    This is the image stuff added just now 3rd september by Marya
//    @State private var selectedImage: UIImage?
//    @State private var isShowingImagePicker = false
//    
////    This is the signup authentication stuff added by Marya in the early hours of Thursday 5th September
//    @State private var showAlert = false
//    @State private var alertMessage = ""
//
//    
//    let authService = AuthenticationServiceClass()
//    
//    
//    var body: some View {
//        ZStack {
//            Color.black
//                .ignoresSafeArea()
//            VStack {
//                Image("Logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 200, height: 200)
//                    .accessibilityIdentifier("Acebook-Logo")
//                
//                Text("Signup")
//                    .font(.largeTitle)
//                    .padding(.bottom, 20)
//                    .accessibilityIdentifier("Signup Button")
//                    .foregroundColor(Color.white)
//                    .background(Color.black)
//                    .font(.system(.body, design: .monospaced))
//                
//                Button(action: {
//                    isShowingImagePicker = true
//                }) {
//                    if let selectedImage = selectedImage {
//                        Image(uiImage: selectedImage)
//                            .resizable()
//                            .scaledToFill()
//                            .frame(width: 100, height: 100)
//                            .clipShape(Circle())
//                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
//                            .shadow(radius: 10)
//                        
//                    } else {
//                        Image(systemName: "person.crop.circle.badge.plus")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 100, height: 100)
//                            .foregroundColor(.white)
//                            .padding()
//                    }
//                } .sheet(isPresented: $isShowingImagePicker) {
//                    ImagePicker(image: $selectedImage)
//                }
//                
//                Form {
//                    Section {
//                        TextField("Username", text: $username)
//                        TextField("Email", text: $email)
//                        TextField("Password", text: $password)
//                        TextField("Confirm password", text: $confirmed_password)
//                    } header:{
//                        Text("Account Details")
//                            .foregroundColor(Color.white)
//                            .background(Color.black)
//                            .font(.system(.body, design: .monospaced))
//                        // TODO: sign up logic
//                    }
//                    
//                }
//                 .frame(width: 300.0, height: 250.0)
//                 .scrollContentBackground(/*@START_MENU_TOKEN@*/.hidden/*@END_MENU_TOKEN@*/)
//                
//                Button("Signup") {
//                    signUp()
//                .accessibilityIdentifier("Signup Button")
//                .buttonStyle(.borderedProminent)
//                .foregroundColor(Color.white)
//                .buttonBorderShape(.roundedRectangle(radius: 20))
//                .font(.system(.body, design: .monospaced))
//                .padding(40)
//                }
//            }
//            private func signUp() {
//                guard password == confirmed_password else {
//                    alertMessage = "Passwords do not match"
//                    showAlert = true
//                    return
//                }
//
//                let imageString = selectedImage?.jpegData(compressionQuality: 0.8)?.base64EncodedString() ?? ""
//
//                let user = User(email: email,
//                                password: password,
//                                username: username,
//                                image: imageString)
//
//                authService.signUp(user: user) { message, error in
//                    DispatchQueue.main.async {
//                        if let error = error {
//                            alertMessage = "Sign up error: \(error.localizedDescription)"
//                        } else if let message = message {
//                            alertMessage = "Sign up successful: \(message)"
//                        }
//                        showAlert = true
//                    }
//                }
//        }
//    }
//
//    
//    struct SignUpPageView_Previews: PreviewProvider {
//        static var previews: some View {
//            SignUpPageView()
//        }
//    }

import SwiftUI

struct SignUpPageView: View {
    
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmed_password = ""
    
    // This is the image stuff added just now 3rd september by Marya
    @State private var selectedImage: UIImage?
    @State private var isShowingImagePicker = false
    
    // This is the signup authentication stuff added by Marya in the early hours of Thursday 5th September
    @State private var showAlert = false
    @State private var alertMessage = ""

    let authService = AuthenticationServiceClass()
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .accessibilityIdentifier("Acebook-Logo")
                
                Text("Signup")
                    .font(.largeTitle)
                    .padding(.bottom, 20)
                    .accessibilityIdentifier("Signup Button")
                    .foregroundColor(Color.white)
                    .background(Color.black)
                    .font(.system(.body, design: .monospaced))
                
                Button(action: {
                    isShowingImagePicker = true
                }) {
                    if let selectedImage = selectedImage {
                        Image(uiImage: selectedImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
                            .shadow(radius: 10)
                        
                    } else {
                        Image(systemName: "person.crop.circle.badge.plus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.white)
                            .padding()
                    }
                } .sheet(isPresented: $isShowingImagePicker) {
                    ImagePicker(image: $selectedImage)
                }
                
                Form {
                    Section {
                        TextField("Username", text: $username)
                        TextField("Email", text: $email)
                        SecureField("Password", text: $password)
                        SecureField("Confirm password", text: $confirmed_password)
                    } header: {
                        Text("Account Details")
                            .foregroundColor(Color.white)
                            .background(Color.black)
                            .font(.system(.body, design: .monospaced))
                    }
                }
                .frame(width: 300.0, height: 250.0)
                .scrollContentBackground(.hidden)
                
                Button("Signup") {
                    signUp()
                }
                .accessibilityIdentifier("Signup Button")
                .buttonStyle(.borderedProminent)
                .foregroundColor(Color.white)
                .buttonBorderShape(.roundedRectangle(radius: 20))
                .font(.system(.body, design: .monospaced))
                .padding(40)
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Sign Up"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }
    
    private func signUp() {
        guard password == confirmed_password else {
            alertMessage = "Passwords do not match"
            showAlert = true
            return
        }
        
//        func compressImage(image: UIImage, compressionQuality: CGFloat = 0.5) -> Data? {
//            return image.jpegData(compressionQuality: compressionQuality) // Adjust quality to reduce size
//        }
//        
//        if let compressedImageData = compressImage(image: selectedImage, compressionQuality: 0.5) {
//            let imgString = compressedImageData.base64EncodedString()
//            // Use this base64 string to send in the request payload
//        }
//

//        let imgUrl = selectedImage?.jpegData(compressionQuality: 0.2)?.base64EncodedString() ?? ""
        
        var imgBase64String = ""
        if let imageData = selectedImage?.jpegData(compressionQuality: 0.2) {
            let imgBase64String = imageData.base64EncodedString()
            // Use imgBase64String in your upload request
        }

        let user = User(username: username,
                        email: email,
                        password: password,
                        imgUrl: imgBase64String)

        authService.signUp(user: user) { message, error in
            DispatchQueue.main.async {
                if let error = error {
                    alertMessage = "Sign up error: \(error.localizedDescription)"
                } else if let message = message {
                    alertMessage = "Sign up was successful Marya: \(message)"
                }
                showAlert = true
            }
        }
    }
}

struct SignUpPageView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpPageView()
    }
}
