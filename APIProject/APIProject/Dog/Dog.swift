//
//  dog.swift
//  APIProject
//
//  Created by Ethan Archibald on 11/29/23.
//

import Foundation

struct Dog: Decodable {
    var message: String
    var status: String
    
    enum CodingKeys: String, CodingKey {
        case message
        case status
    }
}

extension Dog {
    var messageUrl: URL {
        URL(string: message)!
    }
}
