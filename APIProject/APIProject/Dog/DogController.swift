//
//  DogController.swift
//  APIProject
//
//  Created by Ethan Archibald on 11/29/23.
//

import Foundation

class DogController {
    
    func fetchItems() async throws -> Dog {
        var url = URL(string: "https://dog.ceo/api/breeds/image/random")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        return try JSONDecoder().decode(Dog.self, from: data)
    }
    
    func getImageData(for url: URL) async throws -> Data {
        let (data, _) = try await URLSession.shared.data(from: url)
        
        return data
    }
    
}


