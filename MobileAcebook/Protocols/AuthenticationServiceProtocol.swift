//
//  AuthenticationServiceProtocol.swift
//  MobileAcebook
//
//  Created by Josué Estévez Fernández on 01/10/2023.
//

//public protocol AuthenticationServiceProtocol {
//    func signUp(user: User) -> Bool
//    }
//    
//    class AuthenticationService: AuthenticationServiceProtocol {
//        func signUp(user: User) {
//            
//        let json: [String: Any] = ["email": user.email, "password": user.password, "username": user.username, "avatar": user.avatar]
//        let jsonData = try? JSONSerialization.data(withJSONObject: json)
//            
//        guard let url = URL(string: "http://localhost:3000/users") else {
//            return false
//            }
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.httpBody = jsonData
//            
//        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
//                
//            if let error = error {
//                completion(nil, error)
//                return
//            }
//                
//            if let data = data, let apiJSON = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
//                let message = apiJSON["message"] as? String {
//                    // Call the completion block with the message.
//                completion("\(message)", nil)
//            } else {
//                    // If data parsing fails, call the completion block with an error.
//                completion(nil, NSError(domain: "Invalid data", code: 500, userInfo: nil))
//            }
//        }
//            task.resume()
//
//    }
//}

import Foundation
public protocol AuthenticationServiceProtocol {
    func signUp(user: User, completion: @escaping (String?, Error?) -> Void)
}

class AuthenticationServiceClass: AuthenticationServiceProtocol {
    func signUp(user: User, completion: @escaping (String?, Error?) -> Void) {
        let json: [String: Any] = [
            "email": user.email,
            "password": user.password,
            "username": user.username,
            "imgUrl": user.imgUrl
        ]
//        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: json) else {
                   print("Failed to serialize JSON")
                   completion(nil, NSError(domain: "Invalid JSON", code: 400, userInfo: nil))
                   return
               }
        if let jsonString = String(data: jsonData, encoding: .utf8) {
                    print("Request Payload: \(jsonString)")
                }
        
        guard let url = URL(string: "http://localhost:3000/users") else {
            completion(nil, NSError(domain: "Invalid URL", code: 400, userInfo: nil))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        THE LINE ABOVE WAS THE SOURCE OF ALL OF OUR ISSUES LOL - MARYA
        

        
        
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
}
