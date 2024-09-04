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
    
//    This is the image stuff added just now 3rd september by Marya
    @State private var selectedImage: UIImage?
    @State private var isShowingImagePicker = false
    
    
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
                        TextField("Password", text: $password)
                        TextField("Confirm password", text: $confirmed_password)
                    } header:{
                        Text("Account Details")
                            .foregroundColor(Color.white)
                            .background(Color.black)
                            .font(.system(.body, design: .monospaced))
                        // TODO: sign up logic
                    }
                }
                 .frame(width: 300.0, height: 250.0)
                 .scrollContentBackground(/*@START_MENU_TOKEN@*/.hidden/*@END_MENU_TOKEN@*/)
                HStack{
                    Text("Terms and Conditions")
                        .foregroundStyle(Color.white)
                        .font(.system(.body, design: .monospaced, weight: .light))
                    Image(systemName: checkedBox ? "checkmark.circle.fill" : "circle")
                        .font(.system(size: 10))
                        .scaleEffect(checkedBox ? 1.25 : 1.0)
                        .foregroundColor(checkedBox ? .green : .black)
                        .padding()
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 1.0)){
                                checkedBox.toggle()
                            }
                        }
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
                }
                Button("Signup") {
                    print("Button Tapped")
                    }
                .accessibilityIdentifier("Signup Button")
                .buttonStyle(.borderedProminent)
                .foregroundColor(Color.white)
                .buttonBorderShape(.roundedRectangle(radius: 20))
                .font(.system(.body, design: .monospaced))
                .padding(40)
                }
            }
    }
    }


    
    struct SignUpPageView_Previews: PreviewProvider {
        static var previews: some View {
            SignUpPageView()
        }
    }

