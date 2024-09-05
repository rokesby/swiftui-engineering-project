//
//  CreatePostViewModel.swift
//  MobileAcebook
//
//  Created by Santosh Dasari on 05/09/2024.
//

import Foundation

//func submitPost() {
//    guard !postMessage.isEmpty else {
//        // Alert if we want it.
//        return
//    }
//
//    let postEndpoint = "http://127.0.0.1:8080/posts"
//    var postData = [
//        "message": postMessage
//        // userID?
//    ]
//    
//    if let uploadedPostPublicId = uploadedPostPublicId {
//            postData["publicID"] = uploadedPostPublicId
//        }
//
//    guard let url = URL(string: postEndpoint) else {
//        print("Invalid URL")
//        return
//    }
//
//    var request = URLRequest(url: url)
//    request.httpMethod = "POST"
//    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//    guard let userToken = try? KeychainHelper.loadToken() else {
//        print("Failed to load user token")
//        return
//    }
//
//    request.setValue("Bearer \(userToken)", forHTTPHeaderField: "Authorization")
//
//    do {
//        request.httpBody = try JSONSerialization.data(withJSONObject: postData)
//    } catch {
//        print("Error serializing JSON: \(error)")
//        return
//    }
//
//    URLSession.shared.dataTask(with: request) { data, response, error in
//        if let error = error {
//            print("Error submitting post: \(error)")
//            return
//        }
//
//     
//        if let httpResponse = response as? HTTPURLResponse {
//            print("HTTP Response Code: \(httpResponse.statusCode)")
//        }
//
//        DispatchQueue.main.async {
//            
//            postMessage = ""
//            showPostSuccesfulText = true
//            print("Post submitted successfully")
//            
//        }
//        
//    }.resume()
//}
//}
