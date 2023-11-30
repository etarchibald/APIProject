//
//  RepresentativesController.swift
//  APIProject
//
//  Created by Ethan Archibald on 11/30/23.
//

import Foundation

class RepresentativesController {
    
    func fetchItems(matching queryItems: [URLQueryItem]) async throws -> [Representative] {
        var urlComponents = URLComponents(string: "https://whoismyrepresentative.com/getall_mems.php")!
        
        urlComponents.queryItems = queryItems
        
        print(urlComponents)
        
        let (data, _) = try await URLSession.shared.data(from: urlComponents.url!)
        
        print("this is the \(data)")
        let searchResponse = try JSONDecoder().decode(RepResponse.self, from: data)
        print(searchResponse.results)
        return searchResponse.results
    }
}
