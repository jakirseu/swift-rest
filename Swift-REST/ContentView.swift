//ContentView.swift
import SwiftUI

struct ContentView: View {
    
    @State var  posts: [Post] = []
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(posts) { post in
                    NavigationLink(destination: Text(post.title + "\n \n" + post.body) ) {
                        Text(post.title)
                    }
                }
            }
        }.padding()
            .task {
                do {
                    posts =  try await  Networking.loadData()
                    
                } catch {
                    print("Error", error)
                }
            }
    }
}

#Preview {
    ContentView()
}
