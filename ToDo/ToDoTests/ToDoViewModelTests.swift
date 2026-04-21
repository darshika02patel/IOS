//
//  ToDoTests.swift
//  ToDoTests
//
//  Created by Digant Patel on 25/03/26.
//

import Testing
import XCTest
@testable import ToDo

/*
struct ToDoViewModelTests {

    @Test func example() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    }
}
*/

/*
final class ToDoViewModelTests: XCTestCase {
    var viewModel: ToDoViewModel!
    
    override func setUp() {
        viewModel = ToDoViewModel()
    }
    //Test Add Task
    func testAddTask() {
        viewModel.addTask("Buy groceries")
        XCTAssertEqual(viewModel.toTask.count, 1)
        XCTAssertEqual(viewModel.toTask.first?.title, "Buy groceries")
    }
    
    //Test Prevent Empty task
    func testAddEmptyTask() {
        viewModel.addTask("")
        XCTAssertEqual(viewModel.toTask.count, 0)
    }
    
    //Test Toggle Task
    func testToggleTask() {
        viewModel.addTask("Test Task")
        
        let task = viewModel.toTask[0]
        viewModel.toggleTask(task)
        
        XCTAssertTrue(viewModel.toTask[0].isCompleted)
    }
    
    //Test: Delete Task
    func testDeleteTask() {
        viewModel.addTask("Task 1")
        viewModel.addTask("Task 2")
        
        viewModel.deleteTask(IndexSet(integer: 0))
        
        XCTAssertEqual(viewModel.toTask.count, 1)
        XCTAssertEqual(viewModel.toTask[0].title, "Task 2")
    }
}


*/
