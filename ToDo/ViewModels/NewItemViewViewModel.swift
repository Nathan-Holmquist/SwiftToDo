//
//  NewItemViewModel.swift
//  ToDo
//
//  Created by Nathan Holmquist on 3/13/25.
//

import Foundation


class NewItemViewViewModel: ObservableObject {
    
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    
    init() {}
    
    func save() {
        
    }
    
    
    func canSave() -> Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
