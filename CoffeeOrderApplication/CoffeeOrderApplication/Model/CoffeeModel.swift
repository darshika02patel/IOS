//
//  CoffeeModel.swift
//  CoffeeOrderApplication
//
//  Created by Digant Patel on 21/04/26.
//

import Foundation
import Combine

@MainActor
class CoffeeModel: ObservableObject {
    
    let webService: WebService
    @Published private(set) var orders: [Order] = []
    
    
    init(webService: WebService) {
        self.webService = webService
    }
    
    func  populateOrders() async throws {
        orders = try await webService.getOrders()
    }
}
