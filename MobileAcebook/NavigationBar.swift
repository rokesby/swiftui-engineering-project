import SwiftUI

struct CustomNavigationBar: View {
    var body: some View {
        HStack {
            Spacer()
            
            NavigationLink(destination: ContentView()) {
                VStack {
                    Image(systemName: "house.fill")
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                    Text("Home")
                        .font(.caption)
                        .foregroundColor(.white)
                }
            }
            
            Spacer()
            
            NavigationLink(destination: ProfilePageView()) {
                VStack {
                    Image(systemName: "person.fill")
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                    Text("My Profile")
                        .font(.caption)
                        .foregroundColor(.white)
                }
            }
            
            Spacer()
            
            NavigationLink(destination: CreatePostsPageView()) {
                VStack {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                    Text("Create Post")
                        .font(.caption)
                        .foregroundColor(.white)
                }
            }
            
            Spacer()
            
            NavigationLink(destination: WelcomePageView()) {
                VStack {
                    Image(systemName: "arrowshape.turn.up.left.fill")
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                    Text("Logout")
                        .font(.caption)
                        .foregroundColor(.white)
                }
            }
            
            Spacer()
        }
        .padding()
        .background(Color.gray.opacity(0.8))
    }
}

struct CustomNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationBar()
    }
}
