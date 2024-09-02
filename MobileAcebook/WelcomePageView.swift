//
//  WelcomePageView.swift
//  MobileAcebook
//
//  Created by Josué Estévez Fernández on 30/09/2023.
//

import SwiftUI

struct WelcomePageView: View {
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
                
                Text("Welcome to acebook!")
                    .font(.largeTitle)
                    .padding(.bottom, 20)
                    .accessibilityIdentifier("welcomeText")
                    .foregroundColor(Color.white)
                    .background(Color.black)
                    .font(.system(.body, design: .monospaced))
                
                HStack{
                    Button("Sign Up") {
                        print("Button Tapped")
                        // TODO: sign up logic
                    }
                    .accessibilityIdentifier("signUpButton")
                    .buttonStyle(.borderedProminent)
                    .foregroundColor(Color.white)
                    .buttonBorderShape(.roundedRectangle(radius: 20))
                    .font(.system(.body, design: .monospaced))
                    
                    
                    Button("Login") {
                        print("Button Tapped")
                    
                        // TODO: sign up logic
                    }
                    .accessibilityIdentifier("LogInButton")
                    .buttonStyle(.borderedProminent)
                    .foregroundColor(Color.white)
                    .buttonBorderShape(.roundedRectangle(radius: 20))
                    .font(.system(.body, design: .monospaced))
                    
                    }
                }
                
            }
        }
    }
    
    struct WelcomePageView_Previews: PreviewProvider {
        static var previews: some View {
            WelcomePageView()
        }
    }

