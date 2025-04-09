//
//  ToDoListItem.swift
//  ToDo
//
//  Created by Nathan Holmquist on 3/13/25.
//

import Foundation
import FirebaseFirestore

struct ToDoListItem: Codable, Identifiable {
        
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
    }
}
