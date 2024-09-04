import SwiftUI
import Combine

class ProfilePageViewModel: ObservableObject {
    @Published var posts: [Post] = []

    private var cancellables = Set<AnyCancellable>()

    init() {
        fetchPosts()
    }

    func fetchPosts() {
        guard let url = URL(string: "https://yourapi.com/api/posts") else { return }

        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Post].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Failed to fetch posts:", error)
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] posts in
                self?.posts = posts
            })
            .store(in: &cancellables)
    }
}
