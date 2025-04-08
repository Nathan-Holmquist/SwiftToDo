//
//  ToDoApp.swift
//  ToDo
//
//  Created by Nathan Holmquist on 3/13/25.
//
import FirebaseCore
import SwiftUI

@main
struct ToDoApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
