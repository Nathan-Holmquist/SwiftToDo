//
//  NewItemViewModel.swift
//  ToDo
//
//  Created by Nathan Holmquist on 3/13/25.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth


class NewItemViewViewModel: ObservableObject {
    
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    
    init() {}
    
    func save() {
        
        guard canSave() else {
            return
        }
        
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        // Create a model
        let newId = UUID().uuidString
        let newItem = ToDoListItem(
            id: newId,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false
        )
        
        
        // Save a model
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(title)
            .setData(newItem.asDictionary())
                
            
    }
    
    
    func canSave() -> Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else { // number is -1 day
            return false
        }
        
        return true
    }
}
