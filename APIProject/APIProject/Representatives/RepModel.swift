//
//  RepModel.swift
//  APIProject
//
//  Created by Ethan Archibald on 11/30/23.
//

import Foundation

struct RepResponse: Decodable{
    var results: [Representative]
}

struct Representative: Decodable {
    var name: String
    var party: String
    var link: String
    
    enum CodingKeys: CodingKey {
        case name
        case party
        case link
    }
}
