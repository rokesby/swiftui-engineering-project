//
//  LoginPageView.swift
//  MobileAcebook
//
//  Created by Santosh Dasari on 02/09/2024.
//

import Foundation
import SwiftUI

struct LoginPageView: View {
    @State private var username = ""
    @State private var password = ""
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
                
                Text("Login")
                    .font(.largeTitle)
                    .padding(.bottom, 20)
                    .accessibilityIdentifier("Login Button")
                    .foregroundColor(Color.white)
                    .background(Color.black)
                    .font(.system(.body, design: .monospaced))
                Form {
                    Section {
                        TextField("Username", text: $username)
                        TextField("Password", text: $password)
                    } header:{
                    Text("Account Details")
                            .foregroundColor(Color.white)
                            .background(Color.black)
                            .font(.system(.body, design: .monospaced))
                            // TODO: sign up logic
                        }
                    
                }
                .frame(width: 300.0, height: 150.0)
                .scrollContentBackground(/*@START_MENU_TOKEN@*/.hidden/*@END_MENU_TOKEN@*/)
                
                Button("Login") {
                    print("Button Tapped")
                    }
                .accessibilityIdentifier("LogInButton")
                .buttonStyle(.borderedProminent)
                .foregroundColor(Color.white)
                .buttonBorderShape(.roundedRectangle(radius: 20))
                .font(.system(.body, design: .monospaced))
                .padding(40)
                }
            }
        }
    }


struct LoginPageView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPageView()
    }
}
