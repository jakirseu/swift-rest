// networking.swift 
import Foundation

class Networking {
    static func loadData() async throws -> [Post]{
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts")else { fatalError("Invalid URL") }
        // receive the data
        let (data, _) = try await URLSession.shared.data(from: url)
        // decode JSON
        let posts = try JSONDecoder().decode([Post].self, from: data)
        
        return posts
    }
    
}
