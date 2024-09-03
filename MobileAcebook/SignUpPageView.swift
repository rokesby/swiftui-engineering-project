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
    
    var body: some View {
        
        Form{
            Section{
                TextField("Username", text: $username)
                TextField("Email", text: $email)
                TextField("Password", text: $password)
                TextField("Confirm password", text: $confirmed_password)
            } header: {
                Text("Sign up for an account")
            }
        }
        .frame(width: 300.0, height: 150.0)
                        .scrollContentBackground(.hidden)
    }
}

struct SignUpPageView_Previews: PreviewProvider {
        static var previews: some View {
            SignUpPageView()
        }
    }

