//
//  Order.swift
//  CoffeeOrderApplication
//
//  Created by Digant Patel on 21/04/26.
//

import Foundation
/*
enum CoffeeSize: String, Codable {
    case small
    case large
    case medium
}
*/
enum CoffeeSize: String, Codable {
    case small
    case medium
    case large

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(String.self).lowercased()

        guard let size = CoffeeSize(rawValue: rawValue) else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Invalid size '\(rawValue)'. Expected small, medium, or large."
            )
        }
        self = size
    }
}


struct Order: Codable, Identifiable, Hashable {
    var id: String?
    var name: String
    var coffeeName: String
    var total: Double
    var size: CoffeeSize
    let createdAt: String?   // optional — only present after server creates
    let updatedAt: String?
    
    enum CodingKeys: String, CodingKey {
            case id = "_id"
            case name, coffeeName, total, size, createdAt, updatedAt
    }
}

