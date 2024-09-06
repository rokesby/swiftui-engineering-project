import Foundation

class PostViewModel: ObservableObject {
        
    @Published var posts: [Post] = [
        Post(message: "This is my first post", comment: "This is a comment on post 1", likes: 0, imageUrl: "placeholder img url 1", createdAt: "2024-09-03"),
        Post(message: "This is my second post", comment: "This is a comment on post 2", likes: 0, imageUrl: "placeholder img url 2", createdAt: "2024-09-04"),
        Post(message: "This is my third post", comment: "This is a comment on post 3", likes: 0, imageUrl: "placeholder img url 3", createdAt: "2024-09-05")
    ]
    
    @Published var posts2: [Post] = []
    func fetchPosts() {
        print("fetchposts 1 =>")
        guard let url = URL(string: "http://localhost:3000/posts") else { return }
        let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiNjZkNmYxNTk5YzUxNGFjODgxMzM1NDgxIiwiaWF0IjoxNzI1NjEyMzI2LCJleHAiOjE3MjU2MTI5MjZ9.0aRFAVRLfWVs3h7e4hheBy-da0vURoMcLmodHkznGBI"
        
        var request = URLRequest(url:url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        

        /*URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print("data from /posts call=>")
            print(data)
            
            //            let posts2 = try? JSONDecoder().decode([Post].self, from: data)
            let posts2 = try? JSONSerialization.jsonObject(with: data, options: [])
            //            DispatchQueue.main.async {
            //                self.posts2 = posts2 ?? []
            //            }
            print("=> fetchposts2 =>")
            print(posts2)*/
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error fetching data: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            // Convert the Data to a String for readability (Optional)
            if let jsonString = String(data: data, encoding: .utf8) {
                print("JSON Response String: \(jsonString)")
            } else {
                print("Failed to convert data to String.")
            }

            // Try parsing the data as JSON
            do {
                if let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    print("Parsed JSON Object: \(jsonObject)")
                } else {
                    print("Failed to parse JSON object")
                }
            } catch {
                print("JSON parsing error: \(error.localizedDescription)")
            }
        }.resume()
    }
    
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            // Handle errors
//            if let error = error {
//                print("acebook BE-Error: \(error.localizedDescription)")
//                return
//            }
//
//            // Ensure there's a response
//            guard let httpResponse = response as? HTTPURLResponse else {
//                print("acebook BE-Invalid response")
//                return
//            }
//
//            // Check the HTTP status code
//            guard (200...299).contains(httpResponse.statusCode) else {
//                print("acebook BE-Server error: \(httpResponse.statusCode)")
//                return
//            }
//
//            // Process the response data
//            if let data = data {
//                do {
//                    // Example of decoding JSON response
//                    let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
//                    print("acebook BE - Response JSON: \(jsonResponse)")
//                } catch let jsonError {
//                    print("acebook BE-JSON Error: \(jsonError.localizedDescription)")
//                }
//            }
  //      }
 //       task.resume()

    
    func printPosts() {
        // Loop through the array and print each Post's properties
        print("printPosts =>")
        for post in posts {
            print("Post ID: \(post.id)")
            print("Message: \(post.message)")
            print("Comment: \(post.comment)")
            print("Likes: \(post.likes)")
            print("Image URL: \(post.imageUrl)")
            print("Created At: \(post.createdAt)")
            print("-----") // Separator between posts
        }
    }
    
    func likePost(_ post: Post) {
        if let index = posts.firstIndex(where: { $0.id == post.id }) {
            posts[index].likes += 1
        }
    }
    
    func addComment(_ post: Post, newComment: String) {
        if let index = posts.firstIndex(where: { $0.id == post.id }) {
            posts[index].comment = newComment
        }
    }
}

// -----------------------------------------------------------------------------------------------
