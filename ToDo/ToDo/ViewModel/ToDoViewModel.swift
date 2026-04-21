//
//  ToDoViewModel.swift
//  ToDo
//
//  Created by Digant Patel on 24/03/26.
//
import Observation
import SwiftUI

@Observable
class ToDoViewModel {
    
     var toTask: [ToDoTask] = [] {
        didSet {
            saveToDo()
        }
    }
    
    init() {
        loadTodo()
    }
    
    private var key = "TodoKey"
    
    func addTask(_ title: String) {
        let newTask = ToDoTask(id: UUID(), title: title, isCompleted: false)
        toTask.append(newTask)
    }
    
    func deleteTask(_ index: IndexSet) {
        toTask.remove(atOffsets: index)
    }
    
    func toggleTask(_ task: ToDoTask) {
        if let index = toTask.firstIndex(where: {$0.id == task.id}) {
            toTask[index].isCompleted.toggle()
        }
    }
    
    private func saveToDo() {
        if let endcodedData = try? JSONEncoder().encode(toTask) {
            UserDefaults.standard.set(endcodedData, forKey: key)
        }
    }
    
    private func loadTodo() {
        if let decodedData = UserDefaults.standard.data(forKey: key),
           let toDoList = try? JSONDecoder().decode([ToDoTask].self, from: decodedData) {
            toTask = toDoList
        }
    }
}
