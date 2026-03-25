//
//  Task.swift
//  ToDo
//
//  Created by Digant Patel on 24/03/26.
//

import Foundation

struct ToDoTask: Identifiable, Codable {
    var id = UUID()
    var title: String
    var isCompleted: Bool
}

