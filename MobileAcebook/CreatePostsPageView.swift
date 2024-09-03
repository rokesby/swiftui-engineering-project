//
//  CreatePostsPageView.swift
//  MobileAcebook
//
//  Created by Santosh Dasari on 02/09/2024.
//

import SwiftUI

struct CreatePostsPageView: View {
    @State private var postMessage = ""
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            ZStack {
                
                VStack (alignment: .center) {
                    TextField("What's on your mind...", text: $postMessage)
                        .padding()
                    //  .frame(maxHeight: 300)
                        .scrollContentBackground(.hidden)
                    Spacer()
                }
                Button("Submit") {
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
