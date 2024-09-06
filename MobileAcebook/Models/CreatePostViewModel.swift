//
//  CreatePostViewModel.swift
//  MobileAcebook
//
//  Created by Santosh Dasari on 05/09/2024.
//

//let id = UUID()
//var message: String
//var comment: String
//var likes: Int
//var imageUrl: String
//var createdAt: String
import Foundation

func submitPost(post: Post, completion: @escaping (String?, Error?) -> Void) {
    let json: [String: Any] = [
        "message": post.message,
        "imageUrl": post.imageUrl
    ]
    
    guard let jsonData = try? JSONSerialization.data(withJSONObject: json) else {
        print("Failed to serialize JSON")
        completion(nil, NSError(domain: "Invalid JSON", code: 400, userInfo: nil))
        return
    }
    if let jsonString = String(data: jsonData, encoding: .utf8) {
        print("Request Payload: \(jsonString)")
    }
    
    guard let url = URL(string: "http://localhost:3000/posts") else {
        completion(nil, NSError(domain: "Invalid URL", code: 400, userInfo: nil))
        return
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.httpBody = jsonData
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        if let error = error {
            completion(nil, error)
            return
        }
        
        if let data = data,
           let apiJSON = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
           let message = apiJSON["message"] as? String {
            // Call the completion block with the message.
            completion("\(message)", nil)
        } else {
            // If data parsing fails, call the completion block with an error.
            completion(nil, NSError(domain: "Invalid data", code: 500, userInfo: nil))
        }
    }
    task.resume()
}
