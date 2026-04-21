//
//  CoffeeOrderApplicationApp.swift
//  CoffeeOrderApplication
//
//  Created by Digant Patel on 21/04/26.
//

import SwiftUI

@main
struct CoffeeOrderApplicationApp: App {
    
    @StateObject private var model: CoffeeModel
    
    init() {
        let webService = WebService()
        _model = StateObject(wrappedValue: CoffeeModel(webService: webService))
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(model)
        }
    }
}
