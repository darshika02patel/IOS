//
//  ContentView.swift
//  ToDo
//
//  Created by Digant Patel on 24/03/26.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ToDoViewModel()
    @State var newTask: String = ""
    
    var body: some View {
        
        NavigationStack {
            VStack {
                HStack {
                    TextField("Enter a Task: ", text: $newTask)
                        .textFieldStyle(.roundedBorder)
                    Button("Add Task") {
                        guard !newTask.isEmpty else { return }
                        viewModel.addTask(newTask)
                        newTask = ""
                    }
                }
            }
            .padding()
            
            List {
                ForEach(viewModel.toTask) { task in
                    HStack {
                        Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(task.isCompleted ? .green : .gray)
                            .onTapGesture {
                                viewModel.toggleTask(task)
                            }
                            Text(task.title)
                            .strikethrough(task.isCompleted)
                    }
                }
                .onDelete(perform: viewModel.deleteTask)
            }
        }
        .navigationTitle("Notes")
    }
}

#Preview {
    ContentView()
}
