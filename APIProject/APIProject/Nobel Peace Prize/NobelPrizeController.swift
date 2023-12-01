//
//  NobelPrizeController.swift
//  APIProject
//
//  Created by Ethan Archibald on 11/30/23.
//

import Foundation

class NobelPrizeController {
    
    func fetchPrizeWinners(matching queryItems: [URLQueryItem]) async throws -> [Laureates] {
        var urlComponents = URLComponents(string: "https://api.nobelprize.org/v1/prize.json")!
        
        urlComponents.queryItems = queryItems
        
        print(urlComponents)
        
        let (data, _) = try await URLSession.shared.data(from: urlComponents.url!)
        let searchResponse = try JSONDecoder().decode(Prizes.self, from: data)
        
        return searchResponse.prizes
    }
    
}
