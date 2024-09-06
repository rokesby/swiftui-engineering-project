import SwiftUI

class ProfilePageViewModel: ObservableObject {
    @Published var posts: [Post] = []

    init() {
        loadDummyPosts()
    }

    private func loadDummyPosts() {
        // Hardcoded posts using your existing Post model
        posts = [
            Post(message: "Had a great day at the beach!", comment: "Looks amazing!", likes: 120, imageUrl: "https://via.placeholder.com/300", createdAt: "2024-09-03"),
            Post(message: "Just had an amazing lunch! 🍔", comment: "Yummy!", likes: 75, imageUrl: "", createdAt: "2024-09-04"),
            Post(message: "Check out this cool sunset! 🌅", comment: "Beautiful view!", likes: 200, imageUrl: "https://via.placeholder.com/300", createdAt: "2024-09-01"),
            Post(message: "Feeling productive today!", comment: "Good for you!", likes: 50, imageUrl: "", createdAt: "2024-09-05")
        ]
    }
}
