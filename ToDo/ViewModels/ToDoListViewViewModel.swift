//
//  ToDoListViewViewModel.swift
//  ToDo
//
//  Created by Nathan Holmquist on 3/13/25.
//

import Foundation


// Viewmodel for list of items view
// Primary tab
class ToDoListViewViewModel: ObservableObject {
    
    @Published var showingNewItemView = false
    
    init() {}
}
