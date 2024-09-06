//
//  SignUpPageView.swift
//  MobileAcebook
//
//  Created by Santosh Dasari on 02/09/2024.
//

import SwiftUI

struct SignUpPageView: View {
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmed_password = ""
    @State private var checkedBox = false
    
    // Image selection
    @State private var selectedImage: UIImage?
    @State private var isShowingImagePicker = false
    
    // Authentication
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var isSignedUp = false // State variable to control navigation

    let authService = AuthenticationServiceClass()
    
    var body: some View {
        NavigationView { // Embed in NavigationView
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
                    }
                    .sheet(isPresented: $isShowingImagePicker) {
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
                    
                    HStack {
                        Text("Terms and Conditions")
                            .foregroundColor(.white)
                            .font(.system(.body, design: .monospaced, weight: .light))
                        Image(systemName: checkedBox ? "checkmark.circle.fill" : "circle")
                            .font(.system(size: 10))
                            .scaleEffect(checkedBox ? 1.25 : 1.0)
                            .foregroundColor(checkedBox ? .green : .black)
                            .padding()
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 1.0)) {
                                    checkedBox.toggle()
                                }
                            }
                            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
                    }

                    Button("Signup") {
                        signUp()
                    }
                    .accessibilityIdentifier("Signup Button")
                    .buttonStyle(.borderedProminent)
                    .foregroundColor(Color.white)
                    .buttonBorderShape(.roundedRectangle(radius: 20))
                    .font(.system(.body, design: .monospaced))
                    .padding(40)
                    
                    // NavigationLink to redirect to CreatePostsPageView
                    NavigationLink(destination: CreatePostsPageView(), isActive: $isSignedUp) {
                        EmptyView() // Placeholder view, NavigationLink is triggered by isSignedUp
                    }
                }
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Sign Up"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }

// =======
//     @State private var selectedImage: UIImage?
//     @State private var isShowingImagePicker = false
    
//     @State private var showAlert = false
//     @State private var alertMessage = ""
    
//     let authService = AuthenticationServiceClass()
    
//     var body: some View {
//         ZStack {
//             Color.black.ignoresSafeArea()
            
//             VStack {
//                 Image("Logo")
//                     .resizable()
//                     .scaledToFit()
//                     .frame(width: 200, height: 200)
//                     .accessibilityIdentifier("Acebook-Logo")
                
//                 Text("Signup")
//                     .font(.largeTitle)
//                     .padding(.bottom, 20)
//                     .accessibilityIdentifier("Signup Button")
//                     .foregroundColor(Color.white)
//                     .background(Color.black)
//                     .font(.system(.body, design: .monospaced))
                
//                 Button(action: {
//                     isShowingImagePicker = true
//                 }) {
//                     if let selectedImage = selectedImage {
//                         Image(uiImage: selectedImage)
//                             .resizable()
//                             .scaledToFill()
//                             .frame(width: 100, height: 100)
//                             .clipShape(Circle())
//                             .overlay(Circle().stroke(Color.white, lineWidth: 2))
//                             .shadow(radius: 10)
//                     } else {
//                         Image(systemName: "person.crop.circle.badge.plus")
//                             .resizable()
//                             .scaledToFit()
//                             .frame(width: 100, height: 100)
//                             .foregroundColor(.white)
//                             .padding()
//                     }
//                 }
//                 .sheet(isPresented: $isShowingImagePicker) {
//                     ImagePicker(image: $selectedImage)
//                 }
                
//                 Form {
//                     Section {
//                         TextField("Username", text: $username)
//                         TextField("Email", text: $email)
//                         SecureField("Password", text: $password)
//                         SecureField("Confirm password", text: $confirmed_password)
//                     } header: {
//                         Text("Account Details")
//                             .foregroundColor(Color.white)
//                             .background(Color.black)
//                             .font(.system(.body, design: .monospaced))
//                     }
//                 }
//                 .frame(width: 300.0, height: 250.0)
//                 .scrollContentBackground(.hidden)
                
//                 HStack {
//                     Text("Terms and Conditions")
//                         .foregroundStyle(Color.white)
//                         .font(.system(.body, design: .monospaced, weight: .light))
//                     Image(systemName: checkedBox ? "checkmark.circle.fill" : "circle")
//                         .font(.system(size: 10))
//                         .scaleEffect(checkedBox ? 1.25 : 1.0)
//                         .foregroundColor(checkedBox ? .green : .black)
//                         .padding()
//                         .onTapGesture {
//                             withAnimation(.easeInOut(duration: 1.0)) {
//                                 checkedBox.toggle()
//                             }
//                         }
//                         .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
//                 }
                
//                 Button("Signup") {
//                     signUp()
//                 }
//                 .accessibilityIdentifier("Signup Button")
//                 .buttonStyle(.borderedProminent)
//                 .foregroundColor(Color.white)
//                 .buttonBorderShape(.roundedRectangle(radius: 20))
//                 .font(.system(.body, design: .monospaced))
//                 .padding(40)
//             }
//         }
//         .alert(isPresented: $showAlert) {
//             Alert(title: Text("Sign Up"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
//         }
//     }
    
    private func signUp() {
        guard password == confirmed_password else {
            alertMessage = "Passwords do not match"
            showAlert = true
            return
        }
        
        var imgBase64String = ""
        
        if let imageData = selectedImage?.jpegData(compressionQuality: 0.01) {
            imgBase64String = imageData.base64EncodedString()
            print("Image base64 string generated successfully")
        } else {
            print("Image was not generated successfully")
        }
        print(imgBase64String)
        
        let user = User(username: username,
                        email: email,
                        password: password,
                        imgUrl: imgBase64String)
        
        authService.signUp(user: user) { message, error in
            DispatchQueue.main.async {
                if let error = error {
                    alertMessage = "Sign up error: \(error.localizedDescription)"
                    showAlert = true
                } else if let message = message {
                    alertMessage = "Sign up was successful: \(message)"
                    showAlert = true
                    isSignedUp = true // Set to true to trigger navigation
                    print(isSignedUp)
                }
            }
        }
    }
}

struct SignUpPageView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpPageView()
    }
}
