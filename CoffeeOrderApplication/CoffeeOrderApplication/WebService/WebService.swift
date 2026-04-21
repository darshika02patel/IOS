//
//  WebService.swift
//  CoffeeOrderApplication
//
//  Created by Digant Patel on 21/04/26.
//

import Foundation

enum NetworkError: Error {
    case badRequest
    case decodingError
    case badUrl
}


class WebService {
    
    func getOrders() async throws -> [Order] {
     
        //http://localhost:3000/test/orders
        guard let url = URL(string: "http://localhost:3000/test/orders") else {
            throw NetworkError.badUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.badRequest
        }
        
        if let jsonString = String(data: data, encoding: .utf8) {
            print("📥 Raw JSON from server:")
            print(jsonString)
            print("—")
        }
        
        do {
            let orders = try JSONDecoder().decode([Order].self, from: data)
            print("✅ Decoded \(orders.count) orders")
            return orders
        } catch {
            print("❌ Decoding error:", error)
            throw error
        }
        
        /*
        guard let orders = try? JSONDecoder().decode([Order].self, from: data) else {
            throw NetworkError.decodingError
        }
        
        return orders
         */
    }
}
