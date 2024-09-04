//
//  AuthenticationServiceProtocol.swift
//  MobileAcebook
//
//  Created by Josué Estévez Fernández on 01/10/2023.
//

public protocol AuthenticationServiceProtocol {
        func signUp(user: User) -> Bool {
            
            let json: [String: Any] = ["email": user.email, "password": user.password, "username": user.username, "avatar": user.avatar]
            let jsonData = try? JSONSerialization.data(withJSONObject: json)
            
            guard let url = URL(string: "http://localhost:3000/users") else {
                return false
            }
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = jsonData
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                if let error = error {
                    completion(nil, error)
                    return
                }
                
                if let data = data, let apiJSON = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
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
