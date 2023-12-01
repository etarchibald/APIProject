//
//  NobelPrizeModel.swift
//  APIProject
//
//  Created by Ethan Archibald on 11/30/23.
//

import Foundation

struct Prizes: Decodable {
    var prizes: [Laureates]
    
    enum CodingKeys: CodingKey {
        case prizes
    }
}

struct Laureates: Decodable {
    var category: String
    var laureates: [PrizeWinner]
    
    enum CodingKeys: String, CodingKey {
        case category
        case laureates = "laureates"
    }
}

struct PrizeWinner: Decodable {
    var firstName: String
    var surName: String
    var motivation: String
    
    enum CodingKeys: String, CodingKey {
        case firstName = "firstname"
        case surName = "surname"
        case motivation = "motivation"
    }
}
