//
//  CreatePostService.swift
//  MobileAcebook
//
//  Created by Marya Shariq on 06/09/2024.
//

import Foundation

class PostServiceClass {
    func createPost(postContent: [String: Any], completion: @escaping (String?, Error?) -> Void) {
        guard let url = URL(string: "https://yourapi.com/posts") else { return }
        
        let token = UserDefaults.standard.object(forKey: "token") as? String ?? "No token"
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        // Convert postContent dictionary to JSON
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: postContent, options: [])
        } catch {
            completion(nil, error)
            return
        }
        
        // Network request
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data,
                  let responseString = String(data: data, encoding: .utf8) else {
                completion(nil, nil)
                return
            }
            
            // Handle successful response
            completion(responseString, nil)
        }.resume()
    }
}

