//
//  ContentView.swift
//  CoffeeOrderApplication
//
//  Created by Digant Patel on 21/04/26.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var coffeeModel: CoffeeModel
    
    private func populateOrders() async {
        do {
            try await coffeeModel.populateOrders()
        } catch {
            print(error)
        }
    }
    
    var body: some View {
            VStack {
                List(coffeeModel.orders, id:  \.name) { order in
                    HStack {
                        VStack {
                            Text(order.name).bold()
                            Text("\(order.coffeeName) (\(order.size.rawValue))")
                                .opacity(0.5)
                        }
                        Spacer()
                        Text(order.total as NSNumber, formatter: NumberFormatter.currencyFormatter)
                    }
                }
                
            }.task {
                await populateOrders()
            }
    }
}

#Preview {
    ContentView().environmentObject(CoffeeModel(webService: WebService()))
}
